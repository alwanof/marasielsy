<?php

namespace Modules\Drivers\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class SendAuth2Driver extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {

        //$pass=strtolower(substr($notifiable->hash,0,4)).strtolower(substr($notifiable->phone,2,4));

        return (new MailMessage)
            ->subject('We are glad that you joined the Marasiel family')
            ->greeting('Hello  '.$notifiable->fname)
            ->line('We are glad that you joined the Marasiel family.')
            ->line('You can log in using the following credentials: ')
            ->line('username:')
            ->line($notifiable->email)
            ->line('password:')
            ->line('secret+9314')
            ->line(' You can download Driver App from following links:')
            ->action('Marasiel App', 'http://marasielapp.com')
            ->line('Thank you for using Marasiel App.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
