# source ./env.sh	# probably not needed.

occ app:enable richdocuments	# Does not trigger license grace period, but secureview is unavailable in the UI without license
# occ app:enable pdf_viewer	# for testing interoperability
occ app:enable files_pdfviewer	# for testing interoperability

## configure one of our OLD trusty servers. TODO: deploy own collabora host.
# occ config:app:set richdocuments wopi_url --value https://collabora.owncloud.works:443
occ config:app:set richdocuments wopi_url --value https://collabora.owncloud-demo.com:443

## enable secure view. The occ command does not check the license. -> https://github.com/owncloud/richdocuments/issues/442
occ config:app:set richdocuments secure_view_has_watermark_default --value true
occ config:app:set richdocuments secure_view_can_print_default     --value false
occ config:app:set richdocuments secure_view_open_action_default   --value true	# TODO: what does this do?

## TODO: create a folder share between admin and user1 in secure view mode.
# https://doc.owncloud.com/server/admin_manual/enterprise/collaboration/collabora_secure_view.html#how-to-enable-secure-view
# - docx, .. files are seen by receiving user with watermarks,
# - pdf are seen by receiving user with watermarks
# - jpg and other non-securable files are not visible at all.
cat << EOM >>  ~/POSTINIT.msg
richdocuments:  Also enabled app files_pdfviewer
richdocuments:  Secure_view settings: open_action_default=true, has_watermark_default=true, can_print_default=false
richdocuments:	Do this manually after checking that it is initially grayed out:
richdocuments:		occ config:app:set richdocuments secure_view_option --value true
richdocuments:
richdocuments:  Please add an enterprise license and check the secure view settings in admin->additional
richdocuments:  Please create a share with a user (or group) and check '[x] Secure View' in the sharing permissions
--------------------------------------------------------
EOM

