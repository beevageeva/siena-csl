SienaCsl::Application.routes.draw do
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
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'


   root :to => "users#getUserHome" 


  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  match 'login'  => 'users#login', :as => :login
  match 'logout'  => 'users#logout', :as => :logout
  match 'register'  => 'users#new', :as => :register
  match 'lost_password'  => 'users#get_lost_password', :as => :lost_password

	match 'cambiarEstado/:userid' => 'users#changeActive'
	match 'entrarComo/:userid' => 'users#loginAs'
	match 'home' => 'users#getUserHome'
	match 'ayuda' => 'users#help'
	match 'matricular_alumno/:course_id' => 'student_assigns#enroll'
	match 'matricular_profesor/:course_id' => 'teacher_assigns#enroll'
	match 'matricular_profesor_admin/:course_id/:teacher_id' => 'teacher_assigns#assign_to_course'
	match 'matricular_alumnos/:course_id' => 'student_assigns#register_to_course'
	match 'matricular_profesores/:course_id' => 'teacher_assigns#register_to_course'
	match 'nuevo_nodo/:course_id' => 'nodes#new'
	match 'nuevo_comp_grupo/:competence_id' => 'competence_groups#newAluGroup'
	match 'nuevo_comp_nodo/:competence_id' => 'competence_nodes#newNode'
	match 'importar_compendium/:course_id' => 'nodes#importFromCompendium'
	match 'nueva_pregunta/:course_id' => 'questions#new'
	match 'borrar_imagen/:question_id' => 'questions#deleteImgFile'
 match 'nueva_respuesta/:question_id' => 'question_responses#new'
 match 'nuevo_nodo_asoc/:question_id' => 'node_question_relations#newNode'
 match 'nueva_pregunta_asoc/:node_id' => 'node_question_relations#newQuestion'
 match 'nuevo_alumno/:alu_group_id' => 'student_alu_groups#newStudent'
 match 'trabajos_asignatura/:assignedto_type/:assignedto_id/:course_id' => 'works#listByAssignedtoAndCourse'
 match 'trabajos_asignatura_xml/:assignedto_type/:assignedto_id/:course_id' => 'works#listByAssignedtoAndCourseXML'
 match 'trabajos/:student_id/course_id' => 'works#listByStudent'
 match 'nuevo_trabajo/:student_id/:course_id' => 'works#new'
 match 'nodos/:course_id' => 'nodes#listByCourse' 
 match 'preguntas/:course_id' => 'questions#listByCourse' 
 match 'profesores/:course_id' => 'teacher_assigns#listByCourse' 
 match 'alumnos/:course_id' => 'student_assigns#listByCourse' 
 match 'grupos/:course_id' => 'alu_groups#listByCourse' 
 match 'profesores_no_matriculados/:course_id' => 'teacher_assigns#listByCourseNot' 
 match 'alumnos_no_matriculados/:course_id' => 'student_assigns#listByCourseNot' 
 match 'nuevo_grupo/:course_id' => 'alu_groups#new' 
 match 'grupos_de_alumnos/:student_id/:course_id' => 'alu_groups#listByStudentAndCourse' 
 match 'nuevo_predecesor/:dest_id' => 'edges#new_dest'
 match 'nuevo_sucesor/:src_id' => 'edges#new_src'
 match 'editar/:src_id/:dst_id' => 'edges#edit'
 match 'borrar/:src_id/:dst_id' => 'edges#destroy'
 match 'nuevo_contenido/:node_id' => 'related_contents#new'
 match 'html_related/:related_content_id/*filename' => 'related_contents#view_as_html'  , :filename => /.+/
 match 'asignaturas_mat' => 'courses#indexAssigned'
 match 'exportar_asignatura/:course_id' => 'courses#export'
	match 'importar_asignatura' => 'courses#import'
 match 'cambiar_tema/:theme' => 'users#changeTheme'
 match 'cambiar_idioma/:locale' => 'users#set_locale'
 match 'competencias_grupo/:alu_group_id' => 'competences#listByGroup'
 match 'competencias_grupos' => 'competences#listByGroups'
 match 'ver_chats/:username' => 'users#listChats'

 match 'changePassword/:userid' => 'users#chPw' 
	match 'usuarios_no_activos' => 'users#indexNotActive'
 match 'nuevo_test/:work_id' => 'questions#starttest'
 match 'borrar_image_test/:test_id' => 'tests#deleteTestImage'
 match 'nuevo_trabajo_asign/:course_id/:assignedtoType' => 'works#newAll'

 match 'test/:test_id' => 'questions#test'
 match 'contestar' => 'questions#answer'
 match 'regenerar_test_alumno/:test_id' => 'questions#regenerate_student_id'
 match 'register_to_test/:test_id' => 'tests#register_to_test'
 match 'leave_test/:test_id' => 'tests#leave_test'

 match 'lista_tests/:work_id' => 'tests#listByWork'
 match 'subir_fichero_contenido/:related_content_id' => 'related_contents#uploadFile'
 match 'borrar_fichero_contenido/:name/:related_content_id' => 'related_contents#deleteFile'
 match 'fichero_principal_contenido/:name/:related_content_id' => 'related_contents#mainFile'
 match 'lista_contenidos/:node_id/:recover' => 'related_contents#listByNodeAndRecover'
 match 'subir_fichero_competencia/:alu_group_id/:competence_id' => 'competence_groups#uploadFile'
 match ':controller(/:action(/:id(.:format)))'

end
