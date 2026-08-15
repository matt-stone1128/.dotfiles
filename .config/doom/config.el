;;; $DOOMDIR/config.el -*- lexical-binding: t; no-byte-compile: t; coding: utf-8-unix; -*-

(setq user-full-name "Matt Stone"
      user-mail-address (concat "matt@stoneconstruction.biz"))
(use-package all-the-icons)

(setq gc-cons-threshold 134217738
      gc-cons-percentage 0.1
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      vc-follow-symlinks t
      native-comp-async-report-warnings-errors nil
      load-prefer-newer t)
(set-language-environment "UTF-8")
(set-locale-environment "en_US.UTF-8")
(set-selection-coding-system 'utf-8-unix)
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(global-set-key (kbd "C-<wheel-up>") 'text-scale-increase)
(global-set-key (kbd "C-<wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(setq scroll-conservatively 101
      battery-update-interval 2
      focus-follows-mouse t
      mouse-wheel-scroll-amount '(2 ((shift) . 2))
      mouse-wheel-progressive-speed t
      mouse-wheel-follow-mouse 't
      display-line-numbers-type t
      scroll-step 1
      scroll-margin 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      hscroll-step 1
      hscroll-margin 1
      writeroom-width 100
      writeroom-mode-line t
      writeroom-extra-line-spacing 0.1
      writeroom-maximize-window t
      +zen-text-scale 1)
(setq fancy-battery-show-percentage t)
(setq evil-vsplit-window-right t
      evil-split-window-below t)
(setq which-key-idle-delay 0.2
      which-key-idle-secondary-delay 0.05)
(setq display-line-numbers-type t)   ;; Turn line numbers on
(setq confirm-kill-emacs nil)        ;; Don't confirm on exit
;; (setq initial-buffer-choice 'eshell) ;; Eshell is initial buffer
(setq-default ls-lisp-format-time-list '("%m/%d/%Y %I:%M:%S" "%m/%d/%Y %I:%M:%S"))
(setq ls-lisp-use-localized-time-format t
      display-time-format "%I:%M"
      display-time-default-load-average nil
      confirm-kill-emacs nil
      confirm-kill-processes nil
      tab-width 4
      indent-tabs-mode t
      indent-line-function 'insert-tab
      require-final-newline t
      next-line-add-newlines nil
      inhibit-startup-message t
      initial-scratch-message nil
      large-file-warning-threshold nil)
(setq-default shell-file-name "/bin/zsh")
(setq warning-minimum-level :emergency)
;(scroll-bar-mode -1
;; (add-hook! 'dired-mode-hook 'nerd-icons-dired-mode)
(add-hook! 'dired-mode-hook 'all-the-icons-dired-mode)
(add-hook! 'dired-mode-hook 'garbage-collect)
(add-hook! 'helpful-mode-hook 'mixed-pitch-mode)
(add-hook! 'writeroom-mode-enable-hook 'mixed-pitch-mode)
(add-hook! 'writeroom-mode-disable-hook 'mixed-pitch-mode)
(add-hook! 'doom-switch-buffer-hook 'garbage-collect)
(add-hook! 'minibuffer-setup-hook 'garbage-collect)
(add-hook! '+popup-mode-hook (hide-mode-line-mode 1))
(add-hook! '+popup-mode-hook 'garbage-collect)
(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))

(setq remote-file-name-inhibit-locks t
      tramp-use-scp-direct-remote-copying t
      remote-file-name-inhibit-auto-save-visited t
      tramp-inline-compress-start-size 100000) ; Example value (in bytes)

;; Enable simpleclip globally
(pixel-scroll-precision-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode t)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-dwim-target t)
(setq ranger-show-hidden t)
(setq mouse-drag-and-drop-region t)
(setq mouse-drag-and-drop-region-cross-program t)
(setq mouse-drag-and-drop-region-cut-when-buffers-differ t)
;; Optional: Bind to standard keybindings (Doom uses evil-mode by default)
;; For Evil users, you may need to map these to visual mode.
(require 'simpleclip)
(simpleclip-mode 1)
(map!
 (:v "C-c" #'simpleclip-copy)
 (:v "C-x" #'simpleclip-cut)
 (:i "C-v" #'simpleclip-paste))

(use-package! frames-only-mode
  :config
  (frames-only-mode 1)
  ;; Optional: Rebind common split keys (C-x 2, C-x 3) to create frames instead
  (frames-only-mode-remap-common-window-split-keybindings))

(setq fancy-splash-image (concat doom-private-dir "splash/bluee.png"))
(custom-set-faces!
  '(doom-dashboard-banner :inherit default))

;; (set-frame-parameter (selected-frame) 'alpha '(70 70))
;(set-frame-parameter (selected-frame) 'alpha 90)
;; (add-to-list 'default-frame-alist '(alpha 90 90))
(add-to-list 'default-frame-alist '(alpha-background . 90))
(set-frame-parameter nil 'alpha-background 90)

(setq doom-font (font-spec :family "JetBrains Mono" :size 12 :height 1.0)
      doom-big-font (font-spec :family "JetBrains Mono" :size 18 :height 1.0)
      doom-unicode-font (font-spec :family "JetBrains Mono" :size 12 :height 1.0)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 14 :height 1.1)
      doom-serif-font (font-spec :family "JetBrains Mono" :size 10))
(set-frame-font "JetBrains Mono 10" nil t)

(custom-set-faces
  '(mode-line ((t (:family "GoMono Nerd Font Propo" :size 14))))
  '(mode-line-active ((t (:family "GoMono Nerd Font" :size 14))))
  '(mode-line-inactive ((t (:family "GoMono Nerd Font" :size 14)))))

(custom-set-faces!
    '(font-lock-comment-face :slant italic)
    '(font-lock-keyword-face :slant italic :weight bold)
    ;; '(font-lock-comment-face :foreground "#00A399" :slant italic)
    ;; '(font-lock-keyword-face :foreground "#A3000A" :slant italic :weight bold)
   '(default :foreground "#00A30A"))
;; (add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
;; (load-theme 'doom-tokyo-night t)
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'deeper-blue)
;; (setq doom-theme 'catppuccin)
;; (setq doom-theme 'doom-dark+)
;; (setq doom-theme 'doom-moonlight)

(add-hook! 'doom-dashboard-mode-hook 'garbage-collect)
(add-hook! 'doom-dashboard-mode-hook (hide-mode-line-mode 1))
(add-hook! 'doom-load-theme-hook 'garbage-collect)
(add-hook! 'doom-first-file-hook 'garbage-collect)
(add-hook! 'kill-emacs-hook 'garbage-collect)
(add-hook! 'after-init-hook 'garbage-collect)
(add-hook! 'after-init-hook 'beacon-mode)
(add-hook! 'doom-init-ui-hook 'garbage-collect)
(add-hook! 'doom-after-init-modules-hook 'garbage-collect)
(add-hook! 'eww-mode-hook 'garbage-collect)

(map! :leader
      :desc "Comment line" "-" #'comment-line)

(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle eshell split"            "e" #'+eshell/toggle
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle line numbers"            "l" #'doom/toggle-line-numbers
       :desc "Toggle markdown-view-mode"      "m" #'dt/toggle-markdown-view-mode
       :desc "Toggle truncate lines"          "t" #'toggle-truncate-lines
       :desc "Toggle treemacs"                "T" #'+treemacs/toggle
       :desc "Toggle vterm split"             "v" #'+vterm/toggle
       :desc "Toggle Beacon Mode"             "b" #'beacon-mode
       :desc "Toggle Rainbow Mode"            "r" #'rainbow-mode
       :desc "Toggle Colorful Mode"           "c" #'colorful-mode
       ))
(setq display-line-numbers-type t)
(map! :leader
      (:prefix ("o" . "open here")
       :desc "Open eshell here"    "e" #'+eshell/here
       :desc "Open vterm here"     "v" #'+vterm/here))

(map!
    :m "C-h" #'evil-window-left
    :m "C-j" #'evil-window-down
    :m "C-k" #'evil-window-up
    :m "C-l" #'evil-window-right
    :m "C-w" #'evil-window-vsplit
    :m "C-o" #'evil-window-split
)

(custom-set-faces!
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.6))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.3))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.2))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.1)))))

(defun dt/toggle-markdown-view-mode ()
  "Toggle between `markdown-mode' and `markdown-view-mode'."
  (interactive)
  (if (eq major-mode 'markdown-view-mode)
      (markdown-mode)
    (markdown-view-mode)))

(setq org-directory "~/Org/")
(setq org-modern-table-vertical 1)
(setq org-modern-table t)
(add-hook 'org-mode-hook #'hl-todo-mode)

(map! :mode org-mode
        :localleader
        :n "B" #'org-babel-tangle)

  (map! :map org-mode-map
        :desc "Move line(s) up"        :nv "<M-up>"    #'drag-stuff-up
        :desc "Move line(s) down"      :nv "<M-down>"  #'drag-stuff-down
        :desc "Move line(s) left"      :nv "<M-left>"  #'drag-stuff-left
        :desc "Move line(s) right"     :nv "<M-right>" #'drag-stuff-right
        :desc "Go to prev visual line" :n  "<up>"      #'evil-previous-visual-line
        :desc "Go to next visual line" :n  "<down>"    #'evil-next-visual-line)

(custom-set-faces!
'(org-level-8 :inherit outline-3 :height 1.0)
'(org-level-7 :inherit outline-3 :height 1.0)
'(org-level-6 :inherit outline-3 :height 1.1)
'(org-level-5 :inherit outline-3 :height 1.2)
'(org-level-4 :inherit outline-3 :height 1.3)
'(org-level-3 :inherit outline-3 :height 1.4)
'(org-level-2 :inherit outline-2 :height 1.5)
'(org-level-1 :inherit outline-1 :height 1.6)
'(org-document-title  :height 1.8 :bold t :underline nil))

(use-package! org-auto-tangle
  :after org
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-babel-safelist
        '("config.org"
          "README.org"
          "SHELLS.org"
          "hyperland.org"
          "local.org")))

(after! treemacs
    (setq doom-themes-treemacs-theme "doom-colors")
    (setq doom-themes-treemacs-enable-variable-pitch t))

(beacon-mode 1)

(use-package! drag-stuff
  :defer t
  :init
  (map! "<M-up>" #'drag-stuff-up
        "<M-down>" #'drag-stuff-down
        "<M-left>" #'drag-stuff-left
        "<M-right>" #'drag-stuff-right))

(require 'mu4e)
(setq mail-user-agent 'mu4e-user-agent)
(setq mu4e-sent-folder   "/Sent")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-trash-folder  "/Trash")

(setq mu4e-compose-reply-to-address "matt@stoneconstruction.biz"
      user-mail-address "matt@stoneconstruction.biz"
      user-full-name  "Matt Stone")
(setq message-signature "Matt Stone\nhttp://stoneconstruction.biz\n")

(setq
   message-send-mail-function   'smtpmail-send-it
   smtpmail-default-smtp-server "mail.stoneconstruction.biz"
   smtpmail-smtp-server         "mail.stoneconstruction.biz"
   smtpmail-local-domain        "stoneconstruction.biz")

(setq message-kill-buffer-on-exit t)
(setq mu4e-use-fancy-chars t)
(setq mu4e-attachment-dir "~/Downloads")
(setq mu4e-view-show-images t)
