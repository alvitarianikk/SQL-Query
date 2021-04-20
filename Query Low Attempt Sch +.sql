SELECT  s.student_id, CONCAT('https://admin.geniebook.com/student/edit/', s.student_id), 
                            CONCAT_WS(" ", s.name, s.last_name) AS student_name,
                            s.level, si.display_name AS subject,
                            TRIM(CONCAT_WS(" ", pi.first_name, pi.last_name)) AS parent_name,
                            pi.email_address AS parent_email_address,
                            s.parent_email_address AS parent_email_address2,
                            s.student_email_address,
                            pi.parent_info_id AS parent_id,
                            pi.mobile AS parent_mobile,
                            s.parent_contact AS parent_mobile2,
                            s.date_created AS student_join_date,
                            COUNT(swa.answer_id) AS num_of_questions,
                            GROUP_CONCAT(DISTINCT(sw.worksheet_id) SEPARATOR "|") AS incomplete_worksheet_ids
            FROM            class_student cs
            INNER JOIN      class c
            ON              cs.class_id = c.class_id
            INNER JOIN      subject_id si
            ON              c.subject_id = si.subject_id
            INNER JOIN      student s
            ON              cs.student_id = s.student_id
            LEFT JOIN       parent_info pi
            ON              s.parent_info_id = pi.parent_info_id
            LEFT JOIN       parent p
            ON              s.parent_id = p.id
            LEFT JOIN       student_worksheet sw
            ON              s.student_id = sw.student_id
                        AND sw.status != '.$this->db->escape(STATUS_INACTIVE).'
                        AND sw.completed = '.$this->db->escape(COMPLETE_INCOMPLETE).'
                        AND sw.due_date >= CURDATE()
            LEFT JOIN       worksheet w
            ON              sw.worksheet_id = w.id
                        AND c.subject_id = w.subject_id
            LEFT JOIN       student_worksheet_answer swa
            ON              s.student_id = swa.student_id
                        AND sw.worksheet_id = swa.worksheet_id
                        AND swa.date_created BETWEEN '2021-04-12' AND '2021-04-18'
                        AND swa.answer_id NOT IN (
                                SELECT      swa2.answer_id
                                FROM        student_worksheet_answer swa2
                                INNER JOIN  attendance a
                                ON          swa2.student_id = a.student_id
                                        AND a.attendance_type_id IN ('.ATTENDANCE_REGULAR.', '.ATTENDANCE_REPLACEMENT.')
                                INNER JOIN  eb_room_timeslot rt
                                ON          a.room_timeslot_id = rt.room_timeslot_id
                                INNER JOIN  timeslot_id ti
                                ON          rt.timeslot_id = ti.timeslot_id
                                WHERE       swa2.date_created BETWEEN '2021-04-12' AND '2021-04-18'
                                AND         a.date_attendance BETWEEN  '2021-04-12' AND '2021-04-18'
                                AND         swa2.date_created BETWEEN CONCAT(a.date_attendance, " ", ti.start_time) AND CONCAT(a.date_attendance, " ", ti.end_time)
                                GROUP BY    swa2.answer_id
                            )
            WHERE           c.status = 1
            AND             c.date_start <= CURDATE()
            AND             c.date_end >= CURDATE()
            GROUP BY        cs.student_id, c.subject_id
            HAVING          num_of_questions < 20