<?php

namespace App\Http\Controllers;
use App\Mail\VivaMail;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Auth;
use PDF;
use App\models\Viva;
use Illuminate\Support\Facades\Mail;

class vivaController extends Controller
{

    public function add(Request $req){
        $this->validate($req,[
            'pname'=>'required','year'=>'required','prname'=>'required','prmark'=>'required','sname'=>'required','smark'=>'required',
            'ename'=>'required','emark'=>'required','s1name'=>'required','s2name','s3name'
        ]);
        $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

        while (true){
            $cod=substr(str_shuffle($str_result),
               0, 10);

            $viva=Viva::where('code',$cod)->first();

           if(!$viva){
                $userid=$req->user()['id'];
                $userEmail=$req->user()['email'];
                $smark=(floor((double)$req['smark']*100)/100);
               $prmark=(floor((double)$req['prmark']*100)/100);
               $emark=(floor((double)$req['emark']*100)/100);
               $fmark=(floor(0.3*$smark+0.3*$prmark+0.4*$emark)*100)/100;



                $nviva=Viva::create(['user_id'=>$userid,'pname'=>$req['pname'],'year'=>$req['year'],'prname'=>$req['prname']
                    ,'prmark'=>$prmark,'sname'=>$req['sname'],'smark'=>$smark,'ename'=>$req['ename'],'emark'=>$emark
                    ,'s1name'=>$req['s1name'],'s2name'=>$req['s2name'],'s3name'=>$req['s3name'],'code'=>$cod]);
                $mailData = [
                    'pname'=>$req['pname'],'year'=>$req['year'],'prname'=>$req['prname']
                    ,'prmark'=>$prmark,'sname'=>$req['sname'],'smark'=>$smark,'ename'=>$req['ename'],'emark'=>$emark
                    ,'s1name'=>$req['s1name'],'s2name'=>$req['s2name'],'s3name'=>$req['s3name'],'fmark'=>$fmark

                ];
                $date=$nviva->created_at->format('m/d/Y');
               $pdfData= [
                   'pname'=>$req['pname'],'prname'=>$req['prname']
                   ,'sname'=>$req['sname'],'ename'=>$req['ename']
                   ,'s1name'=>$req['s1name'],'s2name'=>$req['s2name'],'s3name'=>$req['s3name'],'fmark'=>$fmark
             ,'date'=>$date
               ];
               $pdf=PDF::loadview('pdf.vivaPdf',$pdfData);

                Mail::to($userEmail)->send(new VivaMail($mailData,$pdf));
                return response(['vivacode'=>$nviva['code']],200);
            }





           }}







    public function user(Request $req){
        return  $req->user()['id'];
    }
    public function getViva(Request $req){
        $viva=Viva::where('code',$req['code'])->first();
        if(!$viva){
            return response(['error'=>'viva not found'],404);
        }
        $vivaData = [
            'pname'=>$viva['pname'],'year'=>$viva['year'],'prname'=>$viva['prname']
            ,'prmark'=>(double)$viva['prmark'],'sname'=>$viva['sname'],'smark'=>(double)$viva['smark'],'ename'=>$viva['ename'],'emark'=>(double)$viva['emark']
            ,'s1name'=>$viva['s1name'],'s2name'=>$viva['s2name'],'s3name'=>$viva['s3name'],'fmark'=>(0.3*(double)$viva['smark']+0.3*(double)$viva['prmark']+0.4*(double)$viva['emark'])

        ];


        return response($vivaData,200);
    }
    public function userViva(Request $req){
        $userid=$req->user()['id'];
        $vivas=Viva::where('user_id','=',$userid)->get();


        return response($vivas,200);
    }
}
