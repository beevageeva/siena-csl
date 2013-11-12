alter table teacher_assigns add column coordinator boolean;
update teacher_assigns set coordinator = false;
