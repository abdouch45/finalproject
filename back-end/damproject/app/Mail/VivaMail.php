<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class VivaMail extends Mailable
{
    use Queueable, SerializesModels;

    public $mailData;
    protected $pdf;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($mailData,$pdf)
    {
        $this->mailData = $mailData;
        $this->pdf = $pdf;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from(env('MAIL_FROM_ADDRESS'))
            ->subject('viva PV')
            ->view('emails.vivaMail')
            ->attachData($this->pdf->output(), 'vivPV.pdf');
    }
}
