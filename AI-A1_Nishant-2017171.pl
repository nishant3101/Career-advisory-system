start_system:-
	initsystem,
	reset,
	write('-----Lets start by finalising your core area of interest: ------'),nl,
	decide_core(Career),nl,
	write('So we have estabilished that you want to make your future in '),
	write(' '), 
	write(Career),nl,nl,
	description(Career),nl,nl,
	write('Its time to finalise that in which area would you like to specialise.'),nl,
	choose_specialisation(Career,Choice),nl,
	write('So you might want to explore more opportunities in '),
	write(Choice),nl,nl,
	write('------Here is a little job description------'),nl,
	describe(Choice),nl,nl,
	write('------Lets look for some future opportunities----'),nl,nl,
	suggest_future(Future),nl,
	describe(Future).

start_system:-
	write('Sorry, Your choices seems too mixed up.').

initsystem:-
	write('Hi,I am here to help you make decisions for what to do after you finish your graduation.'),nl,nl,
	write('I am gonna ask you some questions, For each question you will have some options to choose from'),nl,nl,
	write('Choose one of them by its index and finish your respone by a dot'),nl,nl.

:-dynamic(store_answers/2).

decide_core(Career):-
	career_choice(Career),!.  %TRIES FOR every possible outcome of Career and tries all the sub queries untill one of them is satisfied. 
suggest_future(Future):-
	future_options(Future),!.

reset:-
	retractall(store_answers(_,_)).

career_choice(electronics_and_communication_engineering):-
	current_branch(ece),
	interest(ece_interest),
	major_projects(ece_projects),
	%major_courses(ece_courses),
	seelater(chips).

career_choice(computer_science_engineering):-
	current_branch(_),
	interest(cse_interest),
	major_projects(cse_projects),
	major_courses(cse_courses),
	seelater(software).


choose_specialisation(Career,Choice):-
	(
		(Career==computer_science_engineering)->specialise_cse(Answer);
		(Career==electronics_and_communication_engineering)->specialise_ece(Answer)
	),
	Choice=Answer.

future_options(higher_studies):-
	research(highly_interested),
	btp_done(yes),
	instantwork(canwait).

future_options(industrial_job):-
	research(no_research),
	instantwork(yes_work).

future_options(research_lab):-
	(
		research(highly_interested);
		research(maybe)
	),
	btp_done(yes),
	instantwork(yes_work).

description(computer_science_engineering):-
	write('Software Engineering is an amazing field. Good luck').
description(electronics_and_communication_engineering):-
	write('Hardware engineers are the people behind everything. Good luck. ').

describe(higher_studies):-
	write('So, you want to explore your field more, thats great'),nl,
	write('You can apply for masters or phd in recognized universities').
describe(industrial_job):-
	write('So, you want to make your hands dirty right after graduation, thats great'),nl,
	write('You can start to apply for major industrial companies in this area'),nl,
	write('I am sure you would nail the work there too').
describe(research_lab):-
	write('Since you interested in doing research and also wants to work right after graduation'),nl,
	write('I suggest you look for opportunities in research labs').

describe(frontend_development):-
	write('A front-end web developer is responsible for implementing visual elements that users see and interact with in a web application'),nl.
describe(backend_development):-
	write('A back-end web developer is responsible for server-side web application logic and integration of the work front-end web developers do'),nl.
describe(ui_ux_designing):-
	write('a technology-focused role that seeks to create digital software that entices the user into a seamless interaction between human and computer'),nl,
	write('This career path seeks to improve the user experience by making web page or software interactions simple, fun, easy and effective.').

describe(machine_learning_or_data_science):-
	write('Machine learning engineers feed data into models defined by data scientists'),nl,
	write('They are also responsible for taking theoretical data science models and helping scale them out to production-level models that can handle terabytes of real-time data'),nl,
	write('Meanwhile a job of a data scientist can be:'),nl,
	write('Collecting data through means such as analyzing business results or by setting up and managing new studies. Transferring data into a new format to make it more appropriate for analysis'),nl.
describe(software_development):-
	write('The one who can do everything'),nl,
	write('A Software Development Engineer (SDE) is responsible for creating cross-platform applications and software systems, applying the principles of computer science, computer engineering, information technology'),nl,
	write('and analysis to help organizations and individuals make informed decisions.').
describe(vlsi):-
	write('The VLSI Design Engineer is responsible for designing the functions of modules of the system-on-chip (SOC) as per input and output specifications given').
describe(wireless_communication):-
	write('Wireless Network Engineer job description includes installing, configuring and maintaining wireless network equipment, network management').
describe(digital_signal_processing):-
	write('A signal processing engineer is an information technologies expert that analyzes and alters digital signals to make them more accurate and reliable').

question(current_branch):-
	write('So what''s your current branch ?'),nl.
question(interest):-
	write('What''s best describe your interest ?'),nl.
question(seelater):-
	write('Where do you see yourselves 5 years down the line ?'),nl.
question(major_courses):-
	write('In which domain have you taken maximum electives ?'),nl.
question(major_projects):-
	write('In which domain have you enjoyed doing projects ?'),nl.
question(specialise_cse):-
	write('Which Area of Computer Science have you liked the most and would like to explore more:'),nl.
question(specialise_ece):-
	write('Which Area of Electronics and Communication have you liked the most and would like to explore more:'),nl.
question(research):-
	write('Are you interested in research ?'),nl.
question(instantwork):-
	write('Are you interested in working right after graduation'),nl.
question(btp_done):-
	write('Have you done B.Tech Project'),nl.

option(yes):-
	write('yes'),nl.
option(no):-
	write('no'),nl.

option(ece):-
	write('Electronics and Communication'),nl.
option(cse):-
	write('Computer Science '),nl.
option(csd):-
	write('Computer Science and Design'),nl.
option(csss):-
	write('Computer Science and Social Sciences'),nl.
option(csam):-
	write('Computer Science and Mathematics'),nl.


option(ece_interest):-
	write('Using my ECE skills to analyse the hardware beneath the softwares'),nl.
option(cse_interest):-
	write('Building cool things from scratch using my computer science skills'),nl.

option(chips):-
	write('Working in the Hardware industry'),nl.
option(software):-
	write('Working in the field of Computer Science'),nl.

option(ece_courses):-
	write('I love studying courses related to Electronics and Communication.'),nl.
option(cse_courses):-
	write('I love studying courses related to Computer Science.'),nl.

option(ece_projects):-
	write('My Github is filled with projects related to ECE'),nl.
option(cse_projects):-
	write('My Github is filled with projects related to CSE'),nl.

option(frontend_development):-
	write('Desining and managing the frontent of websites'),nl.
option(backend_development):-
	write('Designing and managing the backend of websites'),nl.
option(ui_ux_designing):-
	write('UI / UX Designing'),nl.
option(machine_learning_or_data_science):-
	write('Machine Learning / Data Science.'),nl.
option(software_development):-
	write('General Software Development'),nl.

option(vlsi):-
	write('Exploring and playing with IC/ Microprocessors'),nl.
option(wireless_communication):-
	write('Wireless, optical Communication or wireless networks'),nl.
option(digital_signal_processing):-
	write('Image and Signal Processing'),nl.

option(highly_interested):-
	write('Yes, I am highly interested in research'),nl.
option(maybe):-
	write('Maybe'),nl.
option(no_research):-
	write('Not really, no.'),nl.

option(yes_work):-
	write('Yes, definitely'),nl.
option(canwait):-
	write('No, I think I can wait for some time'),nl.

current_branch(Answer):-
	store_answers(current_branch,Answer),!.
current_branch(Answer):-
	\+ store_answers(current_branch,_),
	ask_question(current_branch,Answer,[cse,ece,csd,csss,csam]).	

interest(Answer):-
	store_answers(interest,Answer),!.
interest(Answer):-
	\+ store_answers(interest,_),
	ask_question(interest,Answer,[ece_interest,cse_interest]).

seelater(Answer):-
	store_answers(seelater,Answer),!.
seelater(Answer):-
	\+store_answers(seelater,_),
	ask_question(seelater,Answer,[chips,software]).	

major_courses(Answer):-
	store_answers(major_courses,Answer),!.
major_courses(Answer):-
	\+store_answers(major_courses,_),
	ask_question(major_courses,Answer,[ece_courses,cse_courses]).

major_projects(Answer):-
	store_answers(major_projects,Answer),!.
major_projects(Answer):-
	\+store_answers(major_projects,_),
	ask_question(major_projects,Answer,[ece_projects,cse_projects]).
specialise_cse(Answer):-
	store_answers(specialise_cse,Answer),!.
specialise_cse(Answer):-
	\+store_answers(specialise_cse,_),
	ask_question(specialise_cse,Answer,[frontend_development,backend_development,ui_ux_designing,machine_learning_or_data_science,software_development]).

specialise_ece(Answer):-
	store_answers(specialise_ece,Answer),!.
specialise_ece(Answer):-
	\+store_answers(specialise_ece,_),
	ask_question(specialise_ece,Answer,[vlsi,wireless_communication,digital_signal_processing]).

research(Answer):-
	store_answers(research,Answer),!.
research(Answer):-
	\+store_answers(research,_),
	ask_question(research,Answer,[highly_interested,maybe,no_research]).

instantwork(Answer):-
	store_answers(instantwork,Answer),!.
instantwork(Answer):-
	\+store_answers(instantwork,_),
	ask_question(instantwork,Answer,[yes_work,canwait]).
btp_done(Answer):-
	store_answers(btp_done,Answer),!.
btp_done(Answer):-
	\+store_answers(btp_done,_),
	ask_question(btp_done,Answer,[yes,no]).
%--------------------------------------------------------------------

ask_question(Question,Answer,Options):-
	question(Question),list_options(Options,1),read(Reply),
	find_option(Reply,Options,Selection),
	asserta(store_answers(Question,Selection)),
	Selection=Answer.	

find_option(1, [Head|_] , Head).  % Base case-if the index is one then return the head of the list. 

find_option(Index, [_|Tail], Result) :-
	Nextindex is Index -1,
	find_option(Nextindex, Tail, Result).


list_options([],_).           %base case- options to be generated are empty
list_options([Head|Tail], Index):-  
	write(Index), write(' '),  
	option(Head), nl,
	Next is Index + 1,
	list_options(Tail, Next).






	




