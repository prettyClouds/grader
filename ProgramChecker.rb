require './ProgramDescription'
require './ProgramAction'
require 'open3'
require 'expect'
require 'fileutils'

class ProgramChecker

	def initialize(filename, lab_name)
		@filename = filename
		@lab_name = lab_name
	end

	def run
		FileUtils.chmod "+x", @filename
		cmd_to_run = @filename
		if @filename[-3..-1] == "jar"
			cmd_to_run = "java -jar #{@filename}"
		end

		results = []
		LABS[@lab_name].each do |test_data|
			results.push(run_test(cmd_to_run, test_data))
		end
		simplified_results = simplify(results, LABS[@lab_name])
    end
    
	def run_test(cmd, test_data)
		result = {"pass" => false, "lineByLine" => []}
		Open3.popen3(cmd) do |input, output, error, wait_thr|
			input.sync = true
			output.sync = true
			passed = true
			test_data.each do |expected_action|
				if expected_action.type == "out"
					actual_action = extract_output(output, expected_action.text)
					result["lineByLine"].push(actual_action)
					if actual_action.text != expected_action.text	
						passed = false
						break
					end
				else
					actual_action = try_input(input, expected_action.text)
					result["lineByLine"].push(actual_action)
				end
			end
			result["pass"] = passed
		end
		result
	end

	def extract_output(output, output_text)
		output_buffer = output.expect(output_text, 1)
		if output_buffer
			actual_output = output_buffer[0]
			return ProgramAction.new("out", actual_output)
		else
			letter = ''
			actual_output = ''
			while letter = output.expect(/.*/, 1)
				actual_output += letter[0]
				if(letter == "\n")
					break
				end
			end
			return ProgramAction.new("out", actual_output)
		end
	end

	def try_input(input, input_text)
		begin
			input.write(input_text)
			return ProgramAction.new("in", input_text)
		rescue
			return ProgramAction.new("in", '')
		end
	end


	def simplify ( results, tests )
		simplified_results = []
		tests.zip(results).each do |test_data, result|
			simplified_result = {}
		  	simplified_result["actual"] = concatenate(result["lineByLine"])
		  	simplified_result["expected"] = concatenate(test_data)
		  	simplified_result["pass"] = result["pass"]
	  		simplified_results.push(simplified_result)
	  	end
	  	return simplified_results
    end

    def concatenate (action_array)
    	action_array.inject(""){|output, action| output + action.text }.split("\n")
    end
end