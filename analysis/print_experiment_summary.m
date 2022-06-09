function print_experiment_summary(experiment_name, now, later, p_value)
%PRINT_EXPERIMENT_SUMMARY Summary of this function goes here
%   Detailed explanation goes here
    function dashes = dashes_length_str(s)
        dashes = '';
        for ii=1:length(s)
            dashes = [dashes '-'];
        end
    end

    function joined = join_strings_with_break_line(strings)
        joined = '';
        for ii=1:length(strings)
            joined  = [joined, '\n', strings{ii}];
        end
    end
mean_now = round(mean(100*now),1);
std_now = round(std(100*now), 1);
mean_later = round(mean(100*later),1);
std_later = round(std(100*later),1);
experiment_summary = join_strings_with_break_line({...
    experiment_name, ...
    dashes_length_str(experiment_name),...
    ['\t n = : ' num2str(length(now)+length(later))], ...
    ['\t Mean proporiton Interest choices, NOW: ' num2str(mean_now) '%% (std=' num2str(std_now) ')'], ...
    ['\t Mean proporiton Interest choices, LATER: ', num2str(mean_later) '%% (std=' num2str(std_later) ')'], ...
    ['\t p-value:', num2str(p_value)], '\n' ...
    });

fprintf(experiment_summary);
end