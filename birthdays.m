load('Birthdays_dataset.mat')

%so tbh the way the data is organized is a little silly, so the first
%order of business is going to be to make some new variables that make
%the data a little easier to organize

%to start, let's make a structure that has the data for every month of 
%every year. That way, we can just index into the structure to get the
%data that we want

% just define some different variables for yearly, monthly, and daily data
year_of_birth = ["y2000";"y2001";"y2002";"y2003";"y2004";"y2005";"y2006";"y2007";"y2008";"y2009";"y2010";"y2011";"y2012";"y2013";"y2014"];
yob_days = ["yob2000";"yob2001";"yob2002";"yob2003";"yob2004";"yob2005";"yob2006";"yob2007";"yob2008";"yob2009";"yob2010";"yob2011";"yob2012";"yob2013";"yob2014"];
month_of_birth = ["January";"February";"March";"April";"May";"June";"July";"August";"September";"October";"November";"December"];
day_of_week = ["Monday";"Tuesday";"Wednesday";"Thursday";"Friday";"Saturday";"Sunday"];

% Which day has the most births across years?

for i = 1:numel(year_of_birth) %set up a for loop to define all the years
    getYear = year_of_birth(i);
    getYOB = yob_days(i);
    birthday.(getYear) = Births(Year == (min(Year)-1)+i); 
    yearly_dates.(getYOB) = DayofWeek(Year == (min(Year)-1)+i);
    fn_birthday = fieldnames(birthday);
    fn_yearly_dates = fieldnames(yearly_dates);
    for k = 1:numel(day_of_week) %nest another for loop to get the daily data within each year
        getDay = day_of_week(k);         
        yearly_data.(getYear).(getDay) = birthday.(fn_birthday{i})(yearly_dates.(fn_yearly_dates{i}) == k);
        fn_yearly_data = fieldnames(yearly_data);
        fn_yearly_data_days = fieldnames(yearly_data.(getYear));
        summary.(getYear).(getDay) = mean(yearly_data.(fn_yearly_data{i}).(fn_yearly_data_days{k}));
    end
end

% Which month tends to have the most births?

for i = 1:numel(month_of_birth) 
    getMonth = month_of_birth(i);
    months.(getMonth) = Births(Month == i);
end

% all days
for i = 1:numel(day_of_week)
    getWeek = day_of_week(i);
    days.(getWeek) = Births(DayofWeek == i);
end

% all years
for i = 1:numel(year_of_birth)
    births_in_year(:,i) = sum(Births(Year == 1999+i));
    yearly_sem(:,i) = std(Births(Year == 1999+i));
end

%% Plot everything
%yes, I probably could've written some code to plot in a loop but tbh I got
%lazy and just decided to copy/paste all this to visualize the data ¯\_(?)_/¯
figure(1)
bar([sum(days.Monday) sum(days.Tuesday) sum(days.Wednesday) sum(days.Thursday) sum(days.Friday) sum(days.Saturday) sum(days.Sunday)]); 
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("Births per day")

figure(2)
subplot(3,5,1)
bar([summary.y2000.Monday summary.y2000.Tuesday summary.y2000.Wednesday summary.y2000.Thursday summary.y2000.Friday summary.y2000.Saturday summary.y2000.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2000")
subplot(3,5,2)
bar([summary.y2001.Monday summary.y2001.Tuesday summary.y2001.Wednesday summary.y2001.Thursday summary.y2001.Friday summary.y2001.Saturday summary.y2001.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2001")
subplot(3,5,3)
bar([summary.y2002.Monday summary.y2002.Tuesday summary.y2002.Wednesday summary.y2002.Thursday summary.y2002.Friday summary.y2002.Saturday summary.y2002.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2002")
subplot(3,5,4)
bar([summary.y2003.Monday summary.y2003.Tuesday summary.y2003.Wednesday summary.y2003.Thursday summary.y2003.Friday summary.y2003.Saturday summary.y2003.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2003")
subplot(3,5,5)
bar([summary.y2004.Monday summary.y2004.Tuesday summary.y2004.Wednesday summary.y2004.Thursday summary.y2004.Friday summary.y2004.Saturday summary.y2004.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2004")
subplot(3,5,6)
bar([summary.y2005.Monday summary.y2005.Tuesday summary.y2005.Wednesday summary.y2005.Thursday summary.y2005.Friday summary.y2005.Saturday summary.y2005.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2005")
subplot(3,5,7)
bar([summary.y2006.Monday summary.y2006.Tuesday summary.y2006.Wednesday summary.y2006.Thursday summary.y2006.Friday summary.y2006.Saturday summary.y2006.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2006")
subplot(3,5,8)
bar([summary.y2007.Monday summary.y2007.Tuesday summary.y2007.Wednesday summary.y2007.Thursday summary.y2007.Friday summary.y2007.Saturday summary.y2007.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2007")
subplot(3,5,9)
bar([summary.y2008.Monday summary.y2008.Tuesday summary.y2008.Wednesday summary.y2008.Thursday summary.y2008.Friday summary.y2008.Saturday summary.y2008.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2008")
subplot(3,5,10)
bar([summary.y2009.Monday summary.y2009.Tuesday summary.y2009.Wednesday summary.y2009.Thursday summary.y2009.Friday summary.y2009.Saturday summary.y2009.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2009")
subplot(3,5,11)
bar([summary.y2010.Monday summary.y2010.Tuesday summary.y2010.Wednesday summary.y2010.Thursday summary.y2010.Friday summary.y2010.Saturday summary.y2010.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2010")
subplot(3,5,12)
bar([summary.y2011.Monday summary.y2011.Tuesday summary.y2011.Wednesday summary.y2011.Thursday summary.y2011.Friday summary.y2011.Saturday summary.y2011.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2011")
subplot(3,5,13)
bar([summary.y2012.Monday summary.y2012.Tuesday summary.y2012.Wednesday summary.y2012.Thursday summary.y2012.Friday summary.y2012.Saturday summary.y2012.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2012")
subplot(3,5,14)
bar([summary.y2013.Monday summary.y2013.Tuesday summary.y2013.Wednesday summary.y2013.Thursday summary.y2013.Friday summary.y2013.Saturday summary.y2013.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2013")
subplot(3,5,15)
bar([summary.y2014.Monday summary.y2014.Tuesday summary.y2014.Wednesday summary.y2014.Thursday summary.y2014.Friday summary.y2014.Saturday summary.y2014.Sunday])
set(gca,'XTickLabel',["M";"T";"W";"T";"F";"S";"S"])
xlabel('Day of birth')
ylabel('Number of births')
title("2014")

figure(3)
bar(births_in_year)
set(gca,'XTickLabel',["2000";"2001";"2002";"2003";"2004";"2005";"2006";"2007";"2008";"2009";"2010";"2011";"2012";"2013";"2014"])
xlabel('Year of birth')
ylabel('Number of births')
title('Births per year')

figure(4)
bar([sum(months.January) sum(months.February) sum(months.March) sum(months.April) sum(months.May) sum(months.June) sum(months.July) sum(months.August) sum(months.September) sum(months.October) sum(months.November) sum(months.December)])
set(gca,'XTickLabel',["J";"F";"M";"A";"M";"J";"J";"A";"S";"O";"N";"D"])
xlabel('Month of the year')
ylabel('Number of births')
title("Is Christmas-time Sexy-time?")