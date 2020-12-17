<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\UserRegister;
use Validator;

class ApiController extends Controller
{
    
    public function create(Request $request)
    {
        
        $rules = [
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'mobile_no' => 'required',
            'device_type' => 'required',
            'device_id' => 'required',
            'device_token' => 'required'
            
        ];

        $validator = Validator::make($request->all(),$rules);

        if($validator->fails()){

            return response()->json(["status" =>"false","message" =>"Enter all field required first"],400);
        }

        $rules1 = [
            'email' => 'unique:user_register'
        ];

        $validator = Validator::make($request->all(),$rules1);

        if($validator->fails()){

            return response()->json(["status" =>"false","message" =>"This email is already register"],400);
        }

        $rules2 = [
            'mobile_no' => 'unique:user_register'
        ];

        $validator = Validator::make($request->all(),$rules2);

        if($validator->fails()){

            return response()->json(["status" =>"false","message" =>"This mobile number is already register"],400);
        }

        $userRegister =new UserRegister();

        $userRegister->name =$request->input('name');
        $userRegister->email=$request->input('email');
        $userRegister->password=bcrypt($request->input('password'));
        $userRegister->mobile_no=$request->input('mobile_no');
        $userRegister->device_type=$request->input('device_type');
        $userRegister->device_id=$request->input('device_id');
        $userRegister->device_token=$request->input('device_token');

        $userRegister->save();
   
        return response()->json(["status" =>"true","message" =>"You are register successfully","data" =>$userRegister->only(['id', 'name', 'email', 'mobile_no'])],200);
    }

    public function showAlluserRegister()
    {
        $userRegister =UserRegister::select('id' , 'name', 'email', 'mobile_no')->get();
        //$userRegister =UserRegister::all();
        //$userRegister->only('device_type');
    
        return response()->json(["status" =>"true","message" =>"All user register list","data" =>$userRegister],200);
       

    }

    public function usershowbyId($id)
    {
        $userRegister =UserRegister::find($id);

        if(is_null($userRegister)){
            return response()->json(["status" =>"false","message" =>"User Record not found"],404);
        }

        return response()->json(["status" =>"true","message" =>"User Record found successfully","data" =>$userRegister->only(['id', 'name', 'email', 'mobile_no'])],200);
       
    }

    public  function userUpdatebyId(Request $request, $id)
    {

        $rules = [
            'name' => 'required',
            'mobile_no' => 'required'
        ];

        $validator = Validator::make($request->all(),$rules);

        if($validator->fails()){

            return response()->json(["status" =>"false","message" =>"Enter all field required first"],400);
        }

        

        $userRegister =UserRegister::find($id);

        $userRegister->name =$request->input('name');
        $userRegister->mobile_no=$request->input('mobile_no');

        $userRegister->save();
      
         return response()->json(["status" =>"true","message" =>"User profile update successfully","data" =>$userRegister->only(['id', 'name', 'email', 'mobile_no'])],200);
   
    }


    public  function userDeletebyId(Request $request, $id)
    {
        
        $userRegister =UserRegister::find($id);

        if(is_null($userRegister)){
            return response()->json(["status" =>"false","message" =>"User Record not found"],404);
        }

        $userRegister->delete();

         return response()->json(["status" =>"true","message" =>"User deleted successfully"],200);
   
    }


    public  function userUpdate(Request $request)
    {
        
        $rules = [
            'name' => 'required',
            'mobile_no' => 'required',
            'id' => 'required'
        ];

        $validator = Validator::make($request->all(),$rules);

        if($validator->fails()){

            return response()->json(["status" =>"false","message" =>"Enter all field required first"],400);
        }

        $id=$request->input('id');

        $userRegister = UserRegister::where(['id'=>$id])->first();

        $userRegister->name =$request->input('name');
        $userRegister->mobile_no=$request->input('mobile_no');
    
        $userRegister->update();
      
         return response()->json(["status" =>"true","message" =>"User profile update successfully","data" =>$userRegister->only(['id', 'name', 'mobile_no'])],200);
   
    }


    public  function userLogin(Request $request)
    {
        
        $rules = [
            'email' => 'required',
            'password' => 'required',
            'device_type' => 'required',
            'device_id' => 'required',
            'device_token' => 'required'
        ];

        $validator = Validator::make($request->all(),$rules);

        if($validator->fails()){

            return response()->json(["status" =>"false","message" =>"Enter all field required first"],400);
        }
        $userRegister = UserRegister::where('email', $request->email)->first();

        if ($userRegister) {
            if (Hash::check($request->password, $userRegister->password)) {

                $userRegister->device_type =$request->input('device_type');
                $userRegister->device_id=$request->input('device_id');
                $userRegister->device_token=$request->input('device_token');
                $userRegister->save();

                return response()->json(["status" =>"true","message" =>"You are login successfully","data" =>$userRegister->only(['id','name', 'email', 'mobile_no'])],200);

            } else {
               
                return response()->json(["status" =>"false","message" => "Your password is incorrect"],404);
                
            }
        } else {
            return response()->json(["status" =>"false","message" => "You are not register"],404);

        }
   
    }

}
