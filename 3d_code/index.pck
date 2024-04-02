GDPC                @                                                                         P   res://.godot/exported/133200997/export-0da9c88c1f789cfa891cd44f0340838c-box.scn p             ���������0�'    T   res://.godot/exported/133200997/export-6f75fa77984fd1414fde34711ef38ce3-Snake.scn   �      �      .��O��!��v=�    ,   res://.godot/global_script_class_cache.cfg  �)             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�
      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �-      T       >_��f9�KS����}�       res://CharacterBody3D.gd�      Y      ��q3D[C@LĦx       res://Snake.tscn.remap  P)      b       �7	�C!��n<�u���       res://box.gd        a       ə6�M��ae-"k�	       res://box.tscn.remap�(      `       ��\�8(�I4���"       res://icon.svg  �)      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       ��Kdz�G'��nA睆       res://project.binary .      >      Zq�5;Ϯ]���wBK�       res://variables.gd  �(      g       U�ͣJF�7�(���9�1        extends Node3D
var life = Variables.length
func kill():
	life -= 1
	if life == 0:
		queue_free()
               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    margin    size    script 	   _bundled       Script    res://box.gd ��������      local://BoxShape3D_pb3fb T         local://PackedScene_rooti o         BoxShape3D             PackedScene          	         names "   	      box    script    Node3D    bill 
   transform    StaticBody3D    CollisionShape3D    shape 	   CSGBox3D    	   variants                       ?               ?               ?                            @               @               @                  node_count             nodes     &   ��������       ����                            ����                          ����                                ����                   conn_count              conns               node_paths              editable_instances              version             RSRC    extends CharacterBody3D

@export var box: PackedScene
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var xdir = 0
var ydir = 0
var zdir = 0
var cd
var x = 0
var y = 0
var z = 0
var new_move = true
var reset = false


# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	# Add the gravity.
	if !cd:
		new_move = true
		move_body()
		var temp = box.instantiate()
		temp.position = position
		position += Vector3(zdir, ydir, xdir)
		if Variables.length != 0: %body.add_child(temp)
		cool_down()


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir_rl = Input.get_axis("ui_up", "ui_down")
	var input_dir_fb = Input.get_axis("ui_left", "ui_right")
	var input_dir_ud = Input.get_axis("ydown", "yup")
	if input_dir_rl && xdir == 0 and new_move:
		new_move = false
		xdir = .5 * input_dir_rl
		ydir = 0
		zdir = 0
	if input_dir_fb && zdir == 0 and new_move:
		new_move = false
		xdir = 0
		ydir = 0
		zdir = .5 * input_dir_fb
	if input_dir_ud && ydir == 0 and new_move:
		new_move = false
		xdir = 0
		ydir = .5 * input_dir_ud
		zdir = 0
		
	if Input.is_action_just_pressed("ui_accept"):
		grow()
	move_and_slide()

func move_body():
	for child in %body.get_children():
		if child.has_method("kill"):
			child.kill()


func grow():
	Variables.add_length()

func cool_down():
	cd = true
	await get_tree().create_timer(.2).timeout
	cd = false


func _on_area_3d_body_entered(body):
	if body.get_name() == "bill":
		Variables.reset()
		get_tree().reload_current_scene()
       GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://duadx7yvot2hq"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSRC                    PackedScene            ��������                                            s      resource_local_to_scene    resource_name    custom_solver_bias    margin    size    script    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance 	   _bundled       Script    res://CharacterBody3D.gd ��������   PackedScene    res://box.tscn ��^�6R      local://BoxShape3D_17rf1 �
      !   local://StandardMaterial3D_o3dfb �
         local://PackedScene_cjwwd j         BoxShape3D             StandardMaterial3D          �� ?�� ?�� ?  �?        �?        �?               )\?         PackedScene    r      	         names "         snake    Node3D    box    CharacterBody3D    script    SpotLight3D 
   transform    light_color    Area3D    CollisionShape3D    shape 	   CSGBox3D 	   material    body    unique_name_in_owner    apple_spawn 	   Camera3D    fov    _on_area_3d_body_entered    body_entered    	   variants    	                           �?            ��C?O�$?    O�$���C? u�<!��?���?       ƿ??���>  �?      ?               ?               ?                                          �B      node_count    
         nodes     \   ��������       ����                      ����                     ����                                 ����                                ����               	   	   ����         
                       ����                           ����                           ����                           ����                         conn_count             conns                                     node_paths              editable_instances              version             RSRC        extends Node
var length = 0

func reset():
	length = 0

func add_length():
	length += 1
	print(length)
         [remap]

path="res://.godot/exported/133200997/export-0da9c88c1f789cfa891cd44f0340838c-box.scn"
[remap]

path="res://.godot/exported/133200997/export-6f75fa77984fd1414fde34711ef38ce3-Snake.scn"
              list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ��^�6R   res://box.tscn������v   res://icon.svgt��sd��^   res://Snake.tscn            ECFG	      application/config/name         3d     application/run/main_scene         res://Snake.tscn   application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg     autoload/Variables         *res://variables.gd 	   input/yup�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script         input/ydown�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility  