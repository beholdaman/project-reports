
CREATE TRIGGER insert_actual_hours
AFTER INSERT ON reports
FOR EACH ROW

    BEGIN 

        DECLARE n_hours DECIMAL(16,6);
        

       
        SET n_hours = HOUR(SUBTIME(NEW.hour_end, NEW.hour_start)) + 
            ( MINUTE(SUBTIME(NEW.hour_end, NEW.hour_start))/60 );
        

        UPDATE projects SET act_hours = act_hours + n_hours
            WHERE id = NEW.fk_project;

        with RECURSIVE name_tree as (
            select id, description, fk_project, act_hours_tasks
            from projects
            where id = NEW.fk_project 
            union all
            select projects.id,  projects.description, projects.fk_project, projects.act_hours_tasks
            from projects join name_tree
                on name_tree.fk_project = projects.id  
        )
        UPDATE projects JOIN name_tree ON projects.id = name_tree.id 
            SET projects.act_hours_tasks = projects.act_hours_tasks + n_hours
            WHERE name_tree.id <> NEW.fk_project;


    END;


CREATE TRIGGER delete_actual_hours
AFTER DELETE ON reports
FOR EACH ROW

    BEGIN 

        DECLARE n_hours DECIMAL(16,6);
        

       
        SET n_hours = HOUR(SUBTIME(OLD.hour_end, OLD.hour_start)) + 
            ( MINUTE(SUBTIME(OLD.hour_end, OLD.hour_start))/60 );
        

        UPDATE projects SET act_hours = act_hours - n_hours
            WHERE id = OLD.fk_project;

        with RECURSIVE name_tree as (
            select id, description, fk_project, act_hours_tasks
            from projects
            where id = OLD.fk_project 
            union all
            select projects.id,  projects.description, projects.fk_project, projects.act_hours_tasks
            from projects join name_tree
                on name_tree.fk_project = projects.id  
        )
        UPDATE projects JOIN name_tree ON projects.id = name_tree.id 
            SET projects.act_hours_tasks = projects.act_hours_tasks - n_hours
            WHERE name_tree.id <> OLD.fk_project;


    END;

     CREATE TRIGGER update_actual_hours
    AFTER UPDATE ON reports
    FOR EACH ROW

    BEGIN 

        DECLARE old_hours DECIMAL(16,6);
        DECLARE new_hours DECIMAL(16,6);

        
        SET old_hours = HOUR(SUBTIME(OLD.hour_end, OLD.hour_start)) + 
            ( MINUTE(SUBTIME(OLD.hour_end, OLD.hour_start))/60 );
        SET new_hours = HOUR(SUBTIME(NEW.hour_end, NEW.hour_start)) + 
            ( MINUTE(SUBTIME(NEW.hour_end, NEW.hour_start))/60 );
        

        UPDATE projects SET act_hours = act_hours - old_hours + new_hours
            WHERE id = OLD.fk_project;

        with RECURSIVE name_tree as (
            select id, description, fk_project, act_hours_tasks
            from projects
            where id = OLD.fk_project 
            union all
            select projects.id,  projects.description, projects.fk_project, projects.act_hours_tasks
            from projects join name_tree
                on name_tree.fk_project = projects.id  
        )
        UPDATE projects JOIN name_tree ON projects.id = name_tree.id 
            SET projects.act_hours_tasks = projects.act_hours_tasks - old_hours + new_hours
            WHERE name_tree.id <> OLD.fk_project;


    END;

    CREATE TRIGGER deny_report_overlap
BEFORE INSERT on reports
FOR EACH ROW


BEGIN

    DECLARE n_overlaps INT;


    SET n_overlaps = 0;

    SELECT COUNT(*) INTO n_overlaps
    FROM reports
    WHERE date = NEW.date AND
          fk_project = NEW.fk_project AND
          fk_user = NEW.fk_user AND
          (NEW.hour_start >= hour_start OR NEW.hour_end <= hour_end);

    IF n_overlaps > 0 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Report with overlapping hours present in database';
    END IF;
END;

CREATE TRIGGER deny_report_overlap_on_update
BEFORE UPDATE on reports
FOR EACH ROW


BEGIN

    DECLARE n_overlaps INT;


    SET n_overlaps = 0;

    SELECT COUNT(*) INTO n_overlaps
    FROM reports
    WHERE date = NEW.date AND
          fk_project = NEW.fk_project AND
          fk_user = NEW.fk_user AND
          (NEW.hour_start >= hour_start OR NEW.hour_end <= hour_end);

    IF n_overlaps > 0 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Report with overlapping hours present in database';
    END IF;
END;

ALTER TABLE reports
ADD CONSTRAINT hour_check CHECK 
    (hour_start < hour_end)


