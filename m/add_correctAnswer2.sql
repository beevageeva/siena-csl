alter table answers add column "correctAnswer" boolean not null default false;
update answers a set "correctAnswer"=false;
update answers a set "correctAnswer"=true from  questions q  where a.question_id = q.id and q."correctAnswer" = a.number;



