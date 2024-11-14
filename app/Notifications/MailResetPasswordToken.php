<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class MailResetPasswordToken extends Notification
{

    use Queueable;

    public $token;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($token)
    {
        $this->token = $token;
    }


    public function via($notifiable): array
    {
        return ['mail'];
    }

    public function toMail($notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject("Reset password")
            ->line("You received this email because we received a password reset request for your account.")
            ->action('Reset Password', url(app()->getLocale() . '/password/reset', $this->token))
            ->line('This password reset link will expire in 60 minutes')
            ->line('If you have not requested a password reset, no further action is necessary.');

    }
}
