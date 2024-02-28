function notification --argument-names title notification
  set notif 'display notification "'$notification'" with title "'$title'"'
  osascript -e $notif;
end
