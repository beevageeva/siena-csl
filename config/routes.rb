SienaCsl::Application.routes.draw do



#http verbs are:
#get, post(create new item), put(replace existing item), patch(update existing item), delete(delete existing item)
#patch default for forms hidden field _method


def makeRoutes
  resources :chat_messages

  resources :competence_nodes

  resources :student_alu_groups

  resources :alu_groups

  resources :competence_groups

  resources :competences

  resources :related_contents

  resources :tests

  resources :answers

  resources :question_responses

  resources :node_question_relations

  resources :edges

  resources :teacher_assigns

  resources :student_assigns
  resources :grouptest_chatmessages

  resources :teachers

  resources :admins

  resources :students

  resources :courses

  resources :works

  resources :nodes

  resources :questions

  resources :users

  get '/' => "users#getUserHome" 


  get 'login'  => 'users#login', :as => :login
  get 'logout'  => 'users#logout', :as => :logout
  get 'register'  => 'users#new', :as => :register
  get 'lost_password'  => 'users#get_lost_password', :as => :lost_password

	get 'cambiarEstado/:userid' => 'users#changeActive'
	get 'entrarComo/:userid' => 'users#loginAs'
	get 'home' => 'users#getUserHome'
	get 'ayuda' => 'users#help'
	get 'matricular_alumno/:course_id' => 'student_assigns#enroll'
	get 'matricular_profesor/:course_id' => 'teacher_assigns#enroll'
	get 'cambiar_coordinador/:id/:course_id' => 'teacher_assigns#changeCoordinator'
	get 'matricular_profesor_admin/:course_id/:teacher_id' => 'teacher_assigns#assign_to_course'
	post 'matricular_alumnos/:course_id' => 'student_assigns#register_to_course'
	get 'matricular_profesores/:course_id' => 'teacher_assigns#register_to_course'
	get 'nuevo_nodo/:course_id' => 'nodes#new'
	get 'nuevo_comp_grupo/:competence_id' => 'competence_groups#newAluGroup'
	get 'nuevo_comp_nodo/:competence_id' => 'competence_nodes#newNode'
	get 'importar_compendium/:course_id' => 'nodes#importFromCompendium'
	get 'nueva_pregunta/:course_id' => 'questions#new'
	get 'borrar_imagen/:question_id' => 'questions#deleteImgFile'
 get 'nueva_respuesta/:question_id' => 'question_responses#new'
 get 'nuevo_nodo_asoc/:question_id' => 'node_question_relations#newNode'
 get 'nueva_pregunta_asoc/:node_id' => 'node_question_relations#newQuestion'
 get 'nuevo_alumno/:alu_group_id' => 'student_alu_groups#newStudent'
 get 'trabajos_asignatura/:assignedto_type/:assignedto_id/:course_id' => 'works#listByAssignedtoAndCourse'
 get 'trabajos_asignatura_xml/:assignedto_type/:assignedto_id/:course_id' => 'works#listByAssignedtoAndCourseXML'
 get 'trabajos/:student_id/course_id' => 'works#listByStudent'
 get 'nuevo_trabajo/:student_id/:course_id' => 'works#new'
 get 'nodos/:course_id' => 'nodes#listByCourse' 
 get 'preguntas/:course_id' => 'questions#listByCourse' 
 get 'profesores/:course_id' => 'teacher_assigns#listByCourse' 
 get 'alumnos/:course_id' => 'student_assigns#listByCourse' 
 get 'grupos/:course_id' => 'alu_groups#listByCourse' 
 get 'profesores_no_matriculados/:course_id' => 'teacher_assigns#listByCourseNot' 
 get 'alumnos_no_matriculados/:course_id' => 'student_assigns#listByCourseNot' 
 get 'nuevo_grupo/:course_id' => 'alu_groups#new' 
 get 'grupos_de_alumnos/:student_id/:course_id' => 'alu_groups#listByStudentAndCourse' 
 get 'nuevo_predecesor/:dest_id' => 'edges#new_dest'
 get 'nuevo_sucesor/:src_id' => 'edges#new_src'
 get 'editar/:src_id/:dst_id' => 'edges#edit'
 get 'borrar/:src_id/:dst_id' => 'edges#destroy'
 get 'nuevo_contenido/:node_id' => 'related_contents#new'
 get 'html_related/:related_content_id/*filename' => 'related_contents#view_as_html'  , :filename => /.+/
 get 'asignaturas_mat' => 'courses#indexAssigned'
 get 'exportar_asignatura/:course_id' => 'courses#export'
	get 'importar_asignatura' => 'courses#import'
 get 'cambiar_tema/:theme' => 'users#changeTheme'
 get 'cambiar_idioma/:locale' => 'users#set_locale'
 get 'competencias_grupo/:alu_group_id' => 'competences#listByGroup'
 get 'competencias_grupos' => 'competences#listByGroups'
 get 'ver_chats/:username' => 'users#listChats'

 get 'changePassword/:userid' => 'users#chPw' 
 get 'usuarios_no_activos' => 'users#indexNotActive'
 get 'nuevo_test/:work_id' => 'questions#starttest'
 get 'borrar_image_test/:test_id' => 'tests#deleteTestImage'
 get 'nuevo_trabajo_asign/:course_id/:assignedtoType' => 'works#newAll'

 get 'test/:test_id' => 'questions#test'
 patch 'contestar' => 'questions#answer'
 get 'regenerar_test_alumno/:test_id' => 'questions#regenerate_student_id'
 get 'register_to_test/:test_id' => 'tests#register_to_test'
 get 'leave_test/:test_id' => 'tests#leave_test'
 get 'cambiar_comentario/:grouptest_chatmessage_id' => 'grouptest_chatmessages#changeComment'




 get 'lista_tests/:work_id' => 'tests#listByWork'
 get 'subir_fichero_contenido/:related_content_id' => 'related_contents#uploadFile'
 get 'borrar_fichero_contenido/:name/:related_content_id' => 'related_contents#deleteFile'
 get 'fichero_principal_contenido/:name/:related_content_id' => 'related_contents#mainFile'
 get 'lista_contenidos/:node_id/:recover' => 'related_contents#listByNodeAndRecover'
 get 'subir_fichero_competencia/:alu_group_id/:competence_id' => 'competence_groups#uploadFile'

 get ':controller(/:action(/:id(.:format)))'
 post ':controller(/:action(/:id(.:format)))'

end

makeRoutes

#scope  '/siena2' do
#	makeRoutes
#end


end
