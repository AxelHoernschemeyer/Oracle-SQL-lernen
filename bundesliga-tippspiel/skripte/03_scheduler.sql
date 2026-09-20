BEGIN
	-- Falls der Job schon existiert, löschen wir ihn kurz, um ihn frisch anzulegen.
	BEGIN
		DBMS_SCHEDULER.DROP_JOB(job_name => 'job_bundesliga_import');
	EXCEPTION WHEN OTHERS THEN NULL;
	END;

	-- Hier erstellen wir den vollautomatischen Hintergrund-Job
	DBMS_SCHEDULER.CREATE_JOB (
		job_name		=> 'job_bundesliga_import',
		job_type		=> 'STORED_PROCEDURE',
		job_action		=> 'bl_import_pkg.import_spieltage',	-- Hier wird das neue Package aufgerufen.
		start_date		=> SYSTIMESTAMP,
		repeat_interval => 'FREQ=MINUTELY; INTERVAL=2',		 -- Alle zwei Minuten
		-- repeat_interval  => 'FREQ_SECONDLY; INTERVAL=2' 	 -- Alle zwei Sekunden
		-- repeat_interval  => 'FREQ_DAILY; INTERVAL=2' 	 -- Alle zwei Tage
		-- repeat_interval  => 'FREQ_WEEKLY; INTERVAL=2' 	 -- Alle zwei Wochen
		-- repeat_interval  => 'FREQ_MONTHLY; INTERVAL=2' 	 -- Alle zwei Monate
		-- repeat_interval  => 'FREQ_YEARLY; INTERVAL=2' 	 -- Alle zwei Jahre
		enabled			=> TRUE,								-- Ist der Job aktiv oder nicht.
		comments		=> 'Vollautomatischer Import und Archivierung der Bundesliga Spieltage'
	);
END;
/