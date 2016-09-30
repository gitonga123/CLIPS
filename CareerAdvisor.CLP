

;;****************
;;* DEFFUNCTIONS *
;;****************


(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no))

;;;***************
;;;* QUERY RULES *
;;;***************
(defrule determine-field-status ""
   (not (career-status ?))
   (not (career-advice ?))
   =>
   (assert (career-status (yes-or-no-p "Are you doing computer science or IT (yes/no)? "))))
 
(defrule determine-undertake-computer-it ""
   (career-status no)
   (not (career-advice ?))
   =>
   (assert (career-advice "Sorry this advisory system only deals withh IT/Computer Science")))

(defrule determine-interest-area ""
   (career-status yes)
   (not (career-advice ?))
   =>
   (assert (interest-status
      (ask-question "What computer science or IT area are you interested in  (DBMS/Networking/Programming/IT-Support/Artificial-Intelligence/management)? " 
				dbms networking programming support ai management))))

				
;;;***************
;;;* QUERY RULES For DBMS *
;;;***************	
				
(defrule interest-status-dbms
	(interest-status dbms)
	(not (career-advice ?))
	=>
	(assert (dbms-domain-knowledge (yes-or-no-p "Do you have database programming skills (yes/no)?")))
)
(defrule db-knowledge
	(dbms-domain-knowledge no)
	(not(career-advice ?))
	=>
	(assert (dbms-domain-knowledge-c (yes-or-no-p "Do you have skills in database design and implementation(yes/no)")))
	
)
(defrule dbms-career-path
	(or (dbms-domain-knowledge yes)
	(dbms-domain-knowledge-c yes))
	(not(career-advice ?))
	=>
	(assert (dbms-system-admin (yes-or-no-p "Do you know how to Administer Server Networks (yes/no)")))

)
(defrule dbms-career-path2
	(dbms-system-admin yes)
	(not(career-advice ?))
	=>
	(assert (dbms-system-admin(yes-or-no-p "Do you know how to control, monitor and secure access to data in the database (yes/no)" )))
)
(defrule dbms-career-path3 
	(dbms-system-admin no)
	(not (career-advice ?))
	=>
	(assert (dbms-system-analyist (yes-or-no-p "Do you know how to map database designs to a more comprehadable and understable way ? (yes/no)")))
	
)
(defrule dbms-career-path4 
	(dbms-system-analyist yes)
	(not (career-advice ?))
	=>
	(assert (dbms-system-analyist1 (yes-or-no-p "Do you know how to write database documentation and mantaining data standards ? (yes/no)")))
	
)

;;;***************
;;;* QUERY RULES For Networking*
;;;***************

(defrule networking-career-path
	(interest-status networking)
	(not (career-advice ?))
	=>
	(assert (network-admin (yes-or-no-p "Do you know to administer Network Security ? (yes/no)")))
)
(defrule networking-career-path-2
	(network-admin yes)
	(not (career-advice ?))
	=>
	(assert (network-admin1 (yes-or-no-p "Do you know how to install network systems ? (yes/no)")))
)

(defrule networking-career-path-3
	(network-admin1 yes)
	(not (career-advice ?))
	=>
	(assert (network-admin2 (yes-or-no-p "Do you know how to perform network upgrades ? (yes/no)")))
)
(defrule networking-career-path-4
	(or(network-admin no)
	(network-admin1 no))
	(not (career-advice ?))
	=>
	(assert (network-admin3 (yes-or-no-p "Can you be able to recommend appopriate network security measures ? (yes/no)")))
)



;;;***************
;;;* QUERY RULES For Management*
;;;***************

(defrule management-career-path
	(interest-status management)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career (yes-or-no-p "Can you be able to lead IT Strategic and operational planning to achieve organization goals ?")))
)

(defrule management-career-info
	(management-career yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-1 (yes-or-no-p "Can You manage customer-focused IT function that supports ongoing operations to allow for efficiency, quality and customer service ?\n")))

)

(defrule management-career-path-info2
	(management-career-1 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-2 (yes-or-no-p "Can you develop and implement a customer service platform to serve the organization? ")))

)
(defrule management-career-path-info3
	(management-career-2 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-4 (yes-or-no-p "Are you able to prepare annual IT goals and Budgets to facilitate efficient capture and dissemination of information? ")))

)
(defrule management-career-path-info4
	(management-career-4 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-5 (yes-or-no-p "Can ensure that the Protecton of IT and the integrity,security and privacy of information systems,
	communication lines and equipment is maintained? ")))

)
(defrule management-career-path-info5
	(management-career-5 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-6 (yes-or-no-p "Are you able to ensure IT operates according to approved internal standards, external regulatory agencies and all legal requirments ? ")))

)
(defrule management-career-path-info6
	(management-career-6 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-7 (yes-or-no-p "Can you be able to direct the development and execution of an enterprise-wide IT disaster recover and continuity plan ? ")))

)
(defrule management-career-path-info7
	(management-career-7 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-7 (yes-or-no-p "Can you keep up with current trends and issues in the I.T industry, including current technologies and prices? ")))

)
(defrule management-career-path-info8
	(management-career-7 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-8 (yes-or-no-p "Can you advise, counsel and educate executives and management on their competitive or financial impact? ")))

)
(defrule management-career-path-info9
	(management-career-8 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-10 (yes-or-no-p "Can you supervise recruitment, development, retention and organization of all I.T staff? ")))

)
(defrule management-career-path-info10
	(management-career-10 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-11 (yes-or-no-p "Are you planning to undertake master's degree in Business Administration ? ")))

)
(defrule management-career-path-info12
	(management-career-11 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-12 (yes-or-no-p "Do you have the following certification or are planning to undertake them ? CISA, CISM, CCNA, CISSP, ITIL, Oracle or SQL")))

)
(defrule management-career-path-info13
	(management-career-12 yes)
	(not (career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-13 (yes-or-no-p "Do you believe you have leadership skills, that can lead an organization to achieve it goals")))

)

(defrule management-career-socialexpert1
	(management-career no)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career1 (yes-or-no-p "Area you able to develop new partnerships and maintaining strong industrial relationships?")))
)
(defrule management-career-socialexpert2
	(management-career1 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career2 (yes-or-no-p "Are you able to conceptualize and develop all event-related marketing materials? ")))
)
(defrule management-career-socialexpert3
	(management-career2 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career3 (yes-or-no-p "Are you able to plan and execute online and offline marketing campaigns, customers reviews to identify strengths and weakness? ")))
)
(defrule management-career-socialexpert4
	(management-career3 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career4 (yes-or-no-p "Are profcient with Google Docs / Ms Office and Experience in marketing or social medial experience? ")))
)

(defrule management-career-path-lecturer
	(management-career1 no)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-lecturer1 (yes-or-no-p "Are you interested in encouraging personal development through tutorial work ")))
)
(defrule management-career-path-lecturer1
	(or (management-career-lecturer1 yes)
	(management-career-lecturer1 no))
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-lecturer2 (yes-or-no-p "Would you be interested in writing research proposals, papers, and other publications? ")))
)
(defrule management-career-path-lecturer2
	(or (management-career-lecturer2 no)
	(management-career-lecturer2 yes))
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-lecturer3 (yes-or-no-p "Would you be interested in lecture planning, attending and speaking at conferences and seminar? ")))
)
(defrule management-career-path-lecturer3
	(or(management-career-lecturer3 yes)
	(management-career-lecturer3 no))
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-lecturer4 (yes-or-no-p "Are you very good in written and verbal communication skills, and good research skills? ")))
)

(defrule management-career-path-lecturer4
	(management-career-lecturer4 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (management-career-lecturer5 (yes-or-no-p "Do you have good presentation skills and posses good knowledge on a particular subject area or areas? ")))
)
;;;***************
;;;* QUERY RULES For Software Developer/Programming*
;;;***************

(defrule programming-career-path
	(interest-status programming)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career (yes-or-no-p "Are you able to define new process improvement, develop and implement data models that optimize statistical efficiency and data quality.? ")))
)
(defrule programming-career-path-1
	(programming-career yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-1 (yes-or-no-p "Are you able to design and code new systems or the user interface according to user specifications ? ")))
)
(defrule programming-career-path-2
	(programming-career-1 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-2 (yes-or-no-p "Are you able to develop and maintain documentation/manuals on system configuration and make changes to system configuration and parameters to accomdate business and technological requirements? ")))
)
(defrule programming-career-path-3
	(programming-career-2 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-3 (yes-or-no-p "Can you identify, analyze, and interpret trends or patterns in complex data sets and build visualizations to summarize and present key messages to the business? ")))
)
(defrule programming-career-path-4
	(programming-career-3 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-4 (yes-or-no-p "Do you have good knowledge on reporting and business analytics tools ")))
)

(defrule programming-career-path-5
	(programming-career-4 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-5 (yes-or-no-p "Are you passionate about programming and software development ?")))
)

(defrule programming-career-path-6
	(programming-career-5 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-6 (yes-or-no-p "Do you have excellent understanding of programming languages and other programming tools e.g Visual Basic, C#, Java, Objective C, Python ...? ")))
)
(defrule programming-career-path-7
	(programming-career-6 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-7 (yes-or-no-p "Do you posses good knowledge of windows Operating Systems and understanding of Unix and Linux Environment ? ")))
)

(defrule programming-career-path-8
	(programming-career-7 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-8 (yes-or-no-p "Do you have or plan the any certifications in Systems Administration or System Engineer certification in Unix or Microsoft? ")))
)
(defrule programming-career-path1
	(programming-career no)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-web1 (yes-or-no-p "Are you passionate about coding, innovative design and layout of webistes and web-apps ? ")))
)

(defrule programming-career-path2
	(programming-career-web1 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-web2 (yes-or-no-p "Can you write good designs, testables, efficient code by usng the best software development practices ? ")))
)

(defrule programming-career-path3
	(programming-career-web2 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-web3 (yes-or-no-p "Can you integrate site layout/user interface by using standard HTML/CSS practices? ")))
)
(defrule programming-career-path4
	(programming-career-web3 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-web4 (yes-or-no-p "Can you create, maintain software documentation, expanding and plugging into emerging techonlogical trends and apply them into your day to day operations and activites? ")))
)
(defrule programming-career-path5
	(programming-career-web4 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-web5 (yes-or-no-p "Do you have adequate knowledge of relational database systems and Object Oriented Programming ? ")))
)

(defrule programming-career-path-mobile1
	(programming-career-web1 no)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-mobile (yes-or-no-p "Are you interested in Mobile development (e.g Android, IOS, Windows Mobile) ? ")))
)

(defrule programming-career-path-mobile2
	(programming-career-mobile yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-mobile2 (yes-or-no-p "Are you able to integrate mobile screens development with web services and APIs ? "))
))

(defrule programming-career-path-mobile3
	(programming-career-mobile2 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-mobile3 (yes-or-no-p "Are you able provide technical support to users? "))
))
(defrule programming-career-mobile4
	(programming-career-mobile3 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-mobile4 (yes-or-no-p "Do you have knowledge in microsoft Office, Software design and Design Softwares? "))
))
(defrule programming-career-path-mobile5
	(programming-career-mobile4 yes)
	(not(career-advice ?))
	=>
	(printout t crlf)
	(assert (programming-career-mobile5 (yes-or-no-p "Are you aware of mobile development frameworks, databases and SQL languages "))
))

;;;****************
;;;* CAREER ADVISORY RULES *
;;;****************
(defrule final-programming-career-1 ""
	(programming-career-8 yes)
	(not (career-advice ?))
	=>
	(assert (career-advice "Your Career Line in Programming is: SYSTEM DEVELOPER"))
)
(defrule final-programming-career-webdeveloper1 ""
	(programming-career5 yes)
	(not (career-advice ?))
	=>
	(assert (career-advice "Your Career Line in Programming: WEB DEVELOPER"))
)
(defrule final-programming-career-mobile ""
	(programming-career-mobile5 yes)
	(not (career-advice ?))
	=>
	(assert (career-advice "Your Career Line in Programming: MOBILE DEVELOPER"))
)

(defrule final-career-choice-management ""
	(management-career-13 yes)
	(not (career-advice ?))
	=>
	(assert (career-advice "Your Career Line in IT Management is: (senior/chief) INFORMATION OFFICER"))
)

(defrule final-career-choice-management-lecturer ""
	(management-career-lecturer5 yes)
	(not (career-advice ?))
	=>
	(assert (career-advice "Your Career Line in IT Management is: LECTURER"))
)
(defrule final-career-choice-dbms ""
   (dbms-system-admin yes)
   (not (career-advice ?))
   =>
   (assert (career-advice "Your Career Line in Database Management System is: SYSTEM ADMINISTRATOR"))
)

(defrule final-career-choice-dbms-systemadmin ""
   (dbms-system-analyist1 yes)
   (not (career-advice ?))
   =>
  
   (assert (career-advice "Your Career Line in Database Management System is: SYSTEM ANALYST"))
)

(defrule final-choice-management-social ""
   (management-career4 yes)
   (not (career-advice ?))
   =>
  
   (assert (career-advice "Your Career Line in  Management is: SOCIAL MEDIA AND MARKETING MANAGER"))
)

;;;********************************
;;;* STARTUP AND CONCLUSION RULES *
;;;********************************

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "The Career Advisory System")
  (printout t crlf crlf))

(defrule print-advice ""
  (declare (salience 10))
  
  (career-advice ?item)
  =>
  (printout t crlf crlf)
  (printout t "Career Advice:")
  (printout t crlf crlf)
  (format t " %s%n%n%n" ?item))

