<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class CheckoutMail extends Mailable
{
    use Queueable, SerializesModels;
    public $items, $total, $user;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($items, $total, $user)
    {
        $this->items = $items;
        $this->total = $total;
        $this->user = $user;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Purchase Report')->view('emails.checkout_response');

    }
}
