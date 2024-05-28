use v6.c;

use GLib::Raw::Definitions;

unit package WebKit::Raw::Enums:ver<4>;

constant WebKitAuthenticationScheme is export := guint32;
our enum WebKitAuthenticationSchemeEnum is export <
  WEBKIT_AUTHENTICATION_SCHEME_DEFAULT
  WEBKIT_AUTHENTICATION_SCHEME_HTTP_BASIC
  WEBKIT_AUTHENTICATION_SCHEME_HTTP_DIGEST
  WEBKIT_AUTHENTICATION_SCHEME_HTML_FORM
  WEBKIT_AUTHENTICATION_SCHEME_NTLM
  WEBKIT_AUTHENTICATION_SCHEME_NEGOTIATE
  WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED
  WEBKIT_AUTHENTICATION_SCHEME_SERVER_TRUST_EVALUATION_REQUESTED
  WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_PIN_REQUESTED
  WEBKIT_AUTHENTICATION_SCHEME_UNKNOWN
>;

constant WebKitAutomationBrowsingContextPresentation is export := guint32;
our enum WebKitAutomationBrowsingContextPresentationEnum is export <
  WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_WINDOW
  WEBKIT_AUTOMATION_BROWSING_CONTEXT_PRESENTATION_TAB
>;

constant WebKitAutoplayPolicy is export := guint32;
our enum WebKitAutoplayPolicyEnum is export <
  WEBKIT_AUTOPLAY_ALLOW
  WEBKIT_AUTOPLAY_ALLOW_WITHOUT_SOUND
  WEBKIT_AUTOPLAY_DENY
>;

constant WebKitCacheModel is export := guint32;
our enum WebKitCacheModelEnum is export <
  WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER
  WEBKIT_CACHE_MODEL_WEB_BROWSER
  WEBKIT_CACHE_MODEL_DOCUMENT_BROWSER
>;

constant WebKitContextMenuAction is export := guint32;
our enum WebKitContextMenuActionEnum is export <
  WEBKIT_CONTEXT_MENU_ACTION_NO_ACTION
  WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK
  WEBKIT_CONTEXT_MENU_ACTION_OPEN_LINK_IN_NEW_WINDOW
  WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_LINK_TO_DISK
  WEBKIT_CONTEXT_MENU_ACTION_COPY_LINK_TO_CLIPBOARD
  WEBKIT_CONTEXT_MENU_ACTION_OPEN_IMAGE_IN_NEW_WINDOW
  WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_IMAGE_TO_DISK
  WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_TO_CLIPBOARD
  WEBKIT_CONTEXT_MENU_ACTION_COPY_IMAGE_URL_TO_CLIPBOARD
  WEBKIT_CONTEXT_MENU_ACTION_OPEN_FRAME_IN_NEW_WINDOW
  WEBKIT_CONTEXT_MENU_ACTION_GO_BACK
  WEBKIT_CONTEXT_MENU_ACTION_GO_FORWARD
  WEBKIT_CONTEXT_MENU_ACTION_STOP
  WEBKIT_CONTEXT_MENU_ACTION_RELOAD
  WEBKIT_CONTEXT_MENU_ACTION_COPY
  WEBKIT_CONTEXT_MENU_ACTION_CUT
  WEBKIT_CONTEXT_MENU_ACTION_PASTE
  WEBKIT_CONTEXT_MENU_ACTION_DELETE
  WEBKIT_CONTEXT_MENU_ACTION_SELECT_ALL
  WEBKIT_CONTEXT_MENU_ACTION_INPUT_METHODS
  WEBKIT_CONTEXT_MENU_ACTION_UNICODE
  WEBKIT_CONTEXT_MENU_ACTION_SPELLING_GUESS
  WEBKIT_CONTEXT_MENU_ACTION_NO_GUESSES_FOUND
  WEBKIT_CONTEXT_MENU_ACTION_IGNORE_SPELLING
  WEBKIT_CONTEXT_MENU_ACTION_LEARN_SPELLING
  WEBKIT_CONTEXT_MENU_ACTION_IGNORE_GRAMMAR
  WEBKIT_CONTEXT_MENU_ACTION_FONT_MENU
  WEBKIT_CONTEXT_MENU_ACTION_BOLD
  WEBKIT_CONTEXT_MENU_ACTION_ITALIC
  WEBKIT_CONTEXT_MENU_ACTION_UNDERLINE
  WEBKIT_CONTEXT_MENU_ACTION_OUTLINE
  WEBKIT_CONTEXT_MENU_ACTION_INSPECT_ELEMENT
  WEBKIT_CONTEXT_MENU_ACTION_OPEN_VIDEO_IN_NEW_WINDOW
  WEBKIT_CONTEXT_MENU_ACTION_OPEN_AUDIO_IN_NEW_WINDOW
  WEBKIT_CONTEXT_MENU_ACTION_COPY_VIDEO_LINK_TO_CLIPBOARD
  WEBKIT_CONTEXT_MENU_ACTION_COPY_AUDIO_LINK_TO_CLIPBOARD
  WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_CONTROLS
  WEBKIT_CONTEXT_MENU_ACTION_TOGGLE_MEDIA_LOOP
  WEBKIT_CONTEXT_MENU_ACTION_ENTER_VIDEO_FULLSCREEN
  WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PLAY
  WEBKIT_CONTEXT_MENU_ACTION_MEDIA_PAUSE
  WEBKIT_CONTEXT_MENU_ACTION_MEDIA_MUTE
  WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_VIDEO_TO_DISK
  WEBKIT_CONTEXT_MENU_ACTION_DOWNLOAD_AUDIO_TO_DISK
  WEBKIT_CONTEXT_MENU_ACTION_INSERT_EMOJI
  WEBKIT_CONTEXT_MENU_ACTION_PASTE_AS_PLAIN_TEXT
  WEBKIT_CONTEXT_MENU_ACTION_CUSTOM
>;

constant WebKitCookieAcceptPolicy is export := guint32;
our enum WebKitCookieAcceptPolicyEnum is export <
  WEBKIT_COOKIE_POLICY_ACCEPT_ALWAYS
  WEBKIT_COOKIE_POLICY_ACCEPT_NEVER
  WEBKIT_COOKIE_POLICY_ACCEPT_NO_THIRD_PARTY
>;

constant WebKitCookiePersistentStorage is export := guint32;
our enum WebKitCookiePersistentStorageEnum is export <
  WEBKIT_COOKIE_PERSISTENT_STORAGE_TEXT
  WEBKIT_COOKIE_PERSISTENT_STORAGE_SQLITE
>;

constant WebKitCredentialPersistence is export := guint32;
our enum WebKitCredentialPersistenceEnum is export <
  WEBKIT_CREDENTIAL_PERSISTENCE_NONE
  WEBKIT_CREDENTIAL_PERSISTENCE_FOR_SESSION
  WEBKIT_CREDENTIAL_PERSISTENCE_PERMANENT
>;

constant WebKitWebsiteDataTypes is export := guint32;
our enum WebKitWebsiteDataTypesEnum is export (
  WEBKIT_WEBSITE_DATA_MEMORY_CACHE                 =>  1,
  WEBKIT_WEBSITE_DATA_DISK_CACHE                   =>  1 +< 1,
  WEBKIT_WEBSITE_DATA_OFFLINE_APPLICATION_CACHE    =>  1 +< 2,
  WEBKIT_WEBSITE_DATA_SESSION_STORAGE              =>  1 +< 3,
  WEBKIT_WEBSITE_DATA_LOCAL_STORAGE                =>  1 +< 4,
  WEBKIT_WEBSITE_DATA_INDEXEDDB_DATABASES          =>  1 +< 5,
  WEBKIT_WEBSITE_DATA_COOKIES                      =>  1 +< 6,
  WEBKIT_WEBSITE_DATA_DEVICE_ID_HASH_SALT          =>  1 +< 7,
  WEBKIT_WEBSITE_DATA_HSTS_CACHE                   =>  1 +< 8,
  WEBKIT_WEBSITE_DATA_ITP                          =>  1 +< 9,
  WEBKIT_WEBSITE_DATA_SERVICE_WORKER_REGISTRATIONS =>  1 +< 10,
  WEBKIT_WEBSITE_DATA_DOM_CACHE                    =>  1 +< 11,
  WEBKIT_WEBSITE_DATA_ALL                          => (1 +< 12) - 1
);

constant WebKitDownloadError is export := guint32;
our enum WebKitDownloadErrorEnum is export <
  WEBKIT_DOWNLOAD_ERROR_NETWORK
  WEBKIT_DOWNLOAD_ERROR_CANCELLED_BY_USER
  WEBKIT_DOWNLOAD_ERROR_DESTINATION
>;

constant WebKitEditorTypingAttributes is export := guint32;
our enum WebKitEditorTypingAttributesEnum is export <
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_NONE
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_BOLD
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_ITALIC
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_UNDERLINE
  WEBKIT_EDITOR_TYPING_ATTRIBUTE_STRIKETHROUGH
>;

constant WebKitFaviconDatabaseError is export := guint32;
our enum WebKitFaviconDatabaseErrorEnum is export <
  WEBKIT_FAVICON_DATABASE_ERROR_NOT_INITIALIZED
  WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_NOT_FOUND
  WEBKIT_FAVICON_DATABASE_ERROR_FAVICON_UNKNOWN
>;

constant WebKitFeatureStatus is export := guint32;
our enum WebKitFeatureStatusEnum is export <
  WEBKIT_FEATURE_STATUS_EMBEDDER
  WEBKIT_FEATURE_STATUS_UNSTABLE
  WEBKIT_FEATURE_STATUS_INTERNAL
  WEBKIT_FEATURE_STATUS_DEVELOPER
  WEBKIT_FEATURE_STATUS_TESTABLE
  WEBKIT_FEATURE_STATUS_PREVIEW
  WEBKIT_FEATURE_STATUS_STABLE
  WEBKIT_FEATURE_STATUS_MATURE
>;

constant WebKitFindOptions is export := guint32;
our enum WebKitFindOptionsEnum is export <
  WEBKIT_FIND_OPTIONS_NONE
  WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE
  WEBKIT_FIND_OPTIONS_AT_WORD_STARTS
  WEBKIT_FIND_OPTIONS_TREAT_MEDIAL_CAPITAL_AS_WORD_START
  WEBKIT_FIND_OPTIONS_BACKWARDS
  WEBKIT_FIND_OPTIONS_WRAP_AROUND
>;

constant WebKitHardwareAccelerationPolicy is export := guint32;
our enum WebKitHardwareAccelerationPolicyEnum is export <
  WEBKIT_HARDWARE_ACCELERATION_POLICY_ALWAYS
  WEBKIT_HARDWARE_ACCELERATION_POLICY_NEVER
>;

constant WebKitHitTestResultContext is export := guint32;
our enum WebKitHitTestResultContextEnum is export <
  WEBKIT_HIT_TEST_RESULT_CONTEXT_DOCUMENT
  WEBKIT_HIT_TEST_RESULT_CONTEXT_LINK
  WEBKIT_HIT_TEST_RESULT_CONTEXT_IMAGE
  WEBKIT_HIT_TEST_RESULT_CONTEXT_MEDIA
  WEBKIT_HIT_TEST_RESULT_CONTEXT_EDITABLE
  WEBKIT_HIT_TEST_RESULT_CONTEXT_SCROLLBAR
  WEBKIT_HIT_TEST_RESULT_CONTEXT_SELECTION
>;

constant WebKitInputHints is export := guint32;
our enum WebKitInputHintsEnum is export <
  WEBKIT_INPUT_HINT_NONE
  WEBKIT_INPUT_HINT_SPELLCHECK
  WEBKIT_INPUT_HINT_LOWERCASE
  WEBKIT_INPUT_HINT_UPPERCASE_CHARS
  WEBKIT_INPUT_HINT_UPPERCASE_WORDS
  WEBKIT_INPUT_HINT_UPPERCASE_SENTENCES
  WEBKIT_INPUT_HINT_INHIBIT_OSK
>;

constant WebKitInputPurpose is export := guint32;
our enum WebKitInputPurposeEnum is export <
  WEBKIT_INPUT_PURPOSE_FREE_FORM
  WEBKIT_INPUT_PURPOSE_DIGITS
  WEBKIT_INPUT_PURPOSE_NUMBER
  WEBKIT_INPUT_PURPOSE_PHONE
  WEBKIT_INPUT_PURPOSE_URL
  WEBKIT_INPUT_PURPOSE_EMAIL
  WEBKIT_INPUT_PURPOSE_PASSWORD
>;

constant WebKitInsecureContentEvent is export := guint32;
our enum WebKitInsecureContentEventEnum is export <
  WEBKIT_INSECURE_CONTENT_RUN
  WEBKIT_INSECURE_CONTENT_DISPLAYED
>;

constant WebKitJavascriptError is export := guint32;
our enum WebKitJavascriptErrorEnum is export <
  WEBKIT_JAVASCRIPT_ERROR_SCRIPT_FAILED
  WEBKIT_JAVASCRIPT_ERROR_INVALID_PARAMETER
  WEBKIT_JAVASCRIPT_ERROR_INVALID_RESULT
>;

constant WebKitLoadEvent is export := guint32;
our enum WebKitLoadEventEnum is export <
  WEBKIT_LOAD_STARTED
  WEBKIT_LOAD_REDIRECTED
  WEBKIT_LOAD_COMMITTED
  WEBKIT_LOAD_FINISHED
>;

constant WebKitMediaCaptureState is export := guint32;
our enum WebKitMediaCaptureStateEnum is export <
  WEBKIT_MEDIA_CAPTURE_STATE_NONE
  WEBKIT_MEDIA_CAPTURE_STATE_ACTIVE
  WEBKIT_MEDIA_CAPTURE_STATE_MUTED
>;

constant WebKitMediaError is export := guint32;
our enum WebKitMediaErrorEnum is export <
  WEBKIT_MEDIA_ERROR_WILL_HANDLE_LOAD
>;

constant WebKitNavigationType is export := guint32;
our enum WebKitNavigationTypeEnum is export <
  WEBKIT_NAVIGATION_TYPE_LINK_CLICKED
  WEBKIT_NAVIGATION_TYPE_FORM_SUBMITTED
  WEBKIT_NAVIGATION_TYPE_BACK_FORWARD
  WEBKIT_NAVIGATION_TYPE_RELOAD
  WEBKIT_NAVIGATION_TYPE_FORM_RESUBMITTED
  WEBKIT_NAVIGATION_TYPE_OTHER
>;

constant WebKitNetworkError is export := guint32;
our enum WebKitNetworkErrorEnum is export <
  WEBKIT_NETWORK_ERROR_FAILED
  WEBKIT_NETWORK_ERROR_TRANSPORT
  WEBKIT_NETWORK_ERROR_UNKNOWN_PROTOCOL
  WEBKIT_NETWORK_ERROR_CANCELLED
  WEBKIT_NETWORK_ERROR_FILE_DOES_NOT_EXIST
>;

constant WebKitNetworkProxyMode is export := guint32;
our enum WebKitNetworkProxyModeEnum is export <
  WEBKIT_NETWORK_PROXY_MODE_DEFAULT
  WEBKIT_NETWORK_PROXY_MODE_NO_PROXY
  WEBKIT_NETWORK_PROXY_MODE_CUSTOM
>;

constant WebKitPermissionState is export := guint32;
our enum WebKitPermissionStateEnum is export <
  WEBKIT_PERMISSION_STATE_GRANTED
  WEBKIT_PERMISSION_STATE_DENIED
  WEBKIT_PERMISSION_STATE_PROMPT
>;

constant WebKitPolicyDecisionType is export := guint32;
our enum WebKitPolicyDecisionTypeEnum is export <
  WEBKIT_POLICY_DECISION_TYPE_NAVIGATION_ACTION
  WEBKIT_POLICY_DECISION_TYPE_NEW_WINDOW_ACTION
  WEBKIT_POLICY_DECISION_TYPE_RESPONSE
>;

constant WebKitPolicyError is export := guint32;
our enum WebKitPolicyErrorEnum is export <
  WEBKIT_POLICY_ERROR_FAILED
  WEBKIT_POLICY_ERROR_CANNOT_SHOW_MIME_TYPE
  WEBKIT_POLICY_ERROR_CANNOT_SHOW_URI
  WEBKIT_POLICY_ERROR_FRAME_LOAD_INTERRUPTED_BY_POLICY_CHANGE
  WEBKIT_POLICY_ERROR_CANNOT_USE_RESTRICTED_PORT
>;

constant WebKitPrintError is export := guint32;
our enum WebKitPrintErrorEnum is export <
  WEBKIT_PRINT_ERROR_GENERAL
  WEBKIT_PRINT_ERROR_PRINTER_NOT_FOUND
  WEBKIT_PRINT_ERROR_INVALID_PAGE_RANGE
>;

constant WebKitPrintOperationResponse is export := guint32;
our enum WebKitPrintOperationResponseEnum is export <
  WEBKIT_PRINT_OPERATION_RESPONSE_PRINT
  WEBKIT_PRINT_OPERATION_RESPONSE_CANCEL
>;

constant WebKitSaveMode is export := guint32;
our enum WebKitSaveModeEnum is export <
  WEBKIT_SAVE_MODE_MHTML
>;

constant WebKitScriptDialogType is export := guint32;
our enum WebKitScriptDialogTypeEnum is export <
  WEBKIT_SCRIPT_DIALOG_ALERT
  WEBKIT_SCRIPT_DIALOG_CONFIRM
  WEBKIT_SCRIPT_DIALOG_PROMPT
  WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM
>;

constant WebKitSnapshotError is export := guint32;
our enum WebKitSnapshotErrorEnum is export <
  WEBKIT_SNAPSHOT_ERROR_FAILED_TO_CREATE
>;

constant WebKitSnapshotOptions is export := guint32;
our enum WebKitSnapshotOptionsEnum is export <
  WEBKIT_SNAPSHOT_OPTIONS_NONE
  WEBKIT_SNAPSHOT_OPTIONS_INCLUDE_SELECTION_HIGHLIGHTING
  WEBKIT_SNAPSHOT_OPTIONS_TRANSPARENT_BACKGROUND
>;

constant WebKitSnapshotRegion is export := guint32;
our enum WebKitSnapshotRegionEnum is export <
  WEBKIT_SNAPSHOT_REGION_VISIBLE
  WEBKIT_SNAPSHOT_REGION_FULL_DOCUMENT
>;

constant WebKitTLSErrorsPolicy is export := guint32;
our enum WebKitTLSErrorsPolicyEnum is export <
  WEBKIT_TLS_ERRORS_POLICY_IGNORE
  WEBKIT_TLS_ERRORS_POLICY_FAIL
>;

constant WebKitUserContentFilterError is export := guint32;
our enum WebKitUserContentFilterErrorEnum is export <
  WEBKIT_USER_CONTENT_FILTER_ERROR_INVALID_SOURCE
  WEBKIT_USER_CONTENT_FILTER_ERROR_NOT_FOUND
>;

constant WebKitUserContentInjectedFrames is export := guint32;
our enum WebKitUserContentInjectedFramesEnum is export <
  WEBKIT_USER_CONTENT_INJECT_ALL_FRAMES
  WEBKIT_USER_CONTENT_INJECT_TOP_FRAME
>;

constant WebKitUserMessageError is export := guint32;
our enum WebKitUserMessageErrorEnum is export <
  WEBKIT_USER_MESSAGE_UNHANDLED_MESSAGE
>;

constant WebKitUserScriptInjectionTime is export := guint32;
our enum WebKitUserScriptInjectionTimeEnum is export <
  WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_START
  WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_END
>;

constant WebKitUserStyleLevel is export := guint32;
our enum WebKitUserStyleLevelEnum is export <
  WEBKIT_USER_STYLE_LEVEL_USER
  WEBKIT_USER_STYLE_LEVEL_AUTHOR
>;

constant WebKitWebExtensionMode is export := guint32;
our enum WebKitWebExtensionModeEnum is export <
  WEBKIT_WEB_EXTENSION_MODE_NONE
  WEBKIT_WEB_EXTENSION_MODE_MANIFESTV2
  WEBKIT_WEB_EXTENSION_MODE_MANIFESTV3
>;

constant WebKitWebProcessTerminationReason is export := guint32;
our enum WebKitWebProcessTerminationReasonEnum is export <
  WEBKIT_WEB_PROCESS_CRASHED
  WEBKIT_WEB_PROCESS_EXCEEDED_MEMORY_LIMIT
  WEBKIT_WEB_PROCESS_TERMINATED_BY_API
>;
