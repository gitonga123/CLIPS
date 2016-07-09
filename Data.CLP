(deffacts education
		(education computer_science)
		(education IT)
		)

(deffacts interest_computer_science
	
	(computer_science interest DBMS)
	(computer_science interest SD)
	(computer_science interest Management)
	(computer_science interest Networking)
)
(deffacts interest_IT
	(IT interest Technician)
	(IT interest Management)
	(IT interest Sales)
	)
(deffacts courses_computer_science
	
	(interest DBMS algorithms )
	(interest DBMS programming-and-problem-solving )
	(interest DBMS web-programming )
	(interest DBMS Database-mgt-systems )
	(interest DBMS MIS )
	(interest DBMS DS )
	(interest DBMS OS )
	(interest DBMS Design-thinking )
	(interest DBMS Software-dev )
	
	(SD MIS )
	(SD algorithms-and-data-structure )
	(SD programming-and-problem-solving )
	(SD web-programming )
	(SD ICT-project-management )
	(SD DS )
	(SD OS )
	(SD Design-thinking )
	(SD Software-dev )
	
	(Networking MIS )
	(Networking algorithms-and-data-structure )
	(Networking programming-and-problem-solving )
	(Networking ICT-project-management )
	(Networking computer-networks )
	(Networking computer-security )
	(Networking OS )
	(Networking Digital-electronics )
	(Networking Software-dev )
	(Networking Design-thinking)
	(Networking Computer-architecture)

	(Sales MIS )
	(Sales organization-management )
	(Sales programming-and-problem-solving )
	(Sales Principles-of-business-and-entrepreneurship )
	(Sales OS )
	(Sales SAD )
	(Sales Computer-GRAPHICS)

	(Management MIS )
	(Management ICT-project-management )
	(Management Principles-of-business-and-entrepreneurship )
	(Management OS )
	(Management SAD )	

	(Technician Computer-network )
	(Technician network-security )
	(Technician operating-systems )
	(Technician web-programming )
	(Technician digital-electronics )
	(Technician computer-architecture )
	(Technician computer-graphics )
	
)
(deffacts career-path-management
    (management project-manager)
    (management ICT project-manager)
    (management consultant)
    )
(deffacts career-path-SD
    (SD mobile-developer)
    (SD web-developer)
    (SD web-designer)
    (SD programmer)
    (SD UI-designer)
  )

(deffacts web-developer-roles
  (front-end-programming web-developer)
  (programming-frameworks web-developer)
  (back-end-programming web-developer)
  (web technologies web-developer)
  )
(deffacts web-designer-roles
  (UI design web-designer)
  (front-end-programming web-designer)
  )
(deffacts programmer-roles
  (programming-methodologies programmer)
  (problem-solving programmer)
  (algorithms programmer)
  )
(deffacts UI-designer-roles
  (UI-design UI-designer)
  (front-end-programming UI-designer)
  (design-thinking UI-designer)
  )
(deffacts network-admin-roles
  (administer-network-security network-admin)
  (installation-of-network-systems network-admin)
  (perform-network-upgrades network-admin)
  )
(deffacts cyber-security-roles
  (administer-network-security cyber-security)
  )
(deffacts information-security-roles
  (administer-information-security information-security)
  (implement-information-security information-security)
  )
(deffacts IS-security-roles
  (recommend-suitable-IS IS-security)
  (provide-consultancy-on-IS IS-security)
  )
(deffacts project-manager-roles
  (manage-teams project-manager)
  (manage-resources project-manager)
  (manage-budges project-manager)
  (ability-to-select-effective-ICT-tools project-manager)
  )

(deffacts certification
	(Networking CCNA)
	(Networking CCNP)
	(Networking CISA)
	(Networking CIMP)
	(Networking DMP)
	(SD MCSE)
	(Networking ITL)
	(DBMS OCA)
	(DBMS OCP)
	(DBMS OCM)
	(DBMS OCC)
	(DBMS OCS)
)
(deffacts career-path-sales
	
	(sales sale-representative)
	(sales sales-executive)
)
(deffacts career-path-technician
	(Technician cyber-assistance)
	(Technician computer-lab-technician)
	(Technician computer-technician)
	(Technician training-specialist)
)

(deffacts career-path-database
	(DBMS system-admin)
	(DBMS system-analyst)
)
(deffacts system-admin-role
		(administer-server-networks system-admin)
		(monitor-access-and-secuirty system-admin)
		(control-access-permissions-and-priviledges system-admin)
)
(deffacts system-admin-role
	(mapping-designs system-analyst)
	(writing-db-documentations system-analyst)
	(maintaining-data-standards system-analyst)
)

(deffacts career-path-network
	(Networking network-admin)
	(Networking cyber-security)
	(Networking information-security)
	(networking information-systems-auditor)
)

(deffacts cyber-assistance-role
	(manage-play-stations cyber-assistance)
	(print-posters-and-brochures cyber-assistance)
	(conduct-basic-it-training cyber-assistance)
)
(deffacts lab-techician-role
	(networking-skills lab-techician)
	(system-debugging lab-techician)
	(offer-support-and-maintenance lab-techician)
)
(deffacts training-specialist-role
	(conduct-it-training training-specialist)
	(making-presentation training-specialist)
	(effecient-communication-skills training-specialist)
)
(deffacts sales-reps-role
	(understand-computer-architecure sale-representative)
	(marketing-skills sale-representative)
	(knowledge-on-IT-equipment sale-representative)
)

(deffacts sales-executive-role
	(manage-IT-equipments sales-executive)
	(manage-IT-staffs sales-executive)
	(assign-sales-duty sales-executive)
)

(deffacts consultant-role
	(give-advice-on-various-ICT-subects consultant)
	(knowledge-on-appropriate-IT-equipments consultant)
	(recommendations-on-ict-issues consultant)
)


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
      (ask-question "What computer science or IT area are you interested in  (DBMS/Networking/Programming/IT-Support/Artificial-Intelligence)? " dbms networking software-development it-support artificial-intelligence))))
					
(defrule interest-status-dbms
	(interest-status dbms)
	(not (career-advice ?))
	=>
	(assert (dbms-domain-knowledge (yes-or-no-p "Do you have database programming skills (yes/no)?")))
)
(defrule db-knowledge
	(dbms-domain-knowledge yes)
	(not(career-advice ?))
	=>
	(assert (dbms2-domain-knowledge (yes-or-no-p "Do you have skills in database design and implementation(yes/no)")))
	
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

