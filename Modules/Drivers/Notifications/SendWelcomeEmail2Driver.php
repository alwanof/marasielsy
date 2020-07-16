<?php

namespace Modules\Drivers\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class SendWelcomeEmail2Driver extends Notification
{
    use Queueable;
    private $msg;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($msg,$name)
    {
        $this->msg=str_replace('@[name]',$name,$msg);
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
        $render=(new MailMessage)
            ->subject('Welcome to Marasiel')
            ->greeting('');
        foreach (explode('[br]',$this->msg) as $item){
            $render=$render->line($item);
        }


        return $render->action('More Information', 'https://marasielapp.com');
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
