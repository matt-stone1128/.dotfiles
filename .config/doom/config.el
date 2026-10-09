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
      load-prefer-newer t
      tab-always-indent 'complete)

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

(delete-selection-mode t)

(setq evil-vsplit-window-right t
      evil-split-window-below t)


(require 'rainbow-delimiters)
(rainbow-delimiters-mode)

(setq-default ls-lisp-format-time-list '("%m/%d/%Y %I:%M:%S" "%m/%d/%Y %I:%M:%S"))

(setq ls-lisp-use-localized-time-format t
      display-time-format "%I:%M"
      display-time-default-load-average nil
      confirm-kill-emacs nil
      confirm-kill-processes nil
      display-line-numbers-type 'relative
      scroll-margin 2
      window-divider-default-right-width 6
      evil-shift-width 4
      tab-width 4
      tab-stop-list (number-sequence 4 200 4)
      indent-tabs-mode nil
      c-default-style "linux"
      c-basic-offset 4
      indent-line-function 'insert-tab
      require-final-newline t
      next-line-add-newlines nil
      inhibit-startup-message t
      initial-scratch-message nil
      large-file-warning-threshold nil)

(setq-default shell-file-name "/bin/zsh")
(setq mouse-drag-and-drop-region t)
(setq mouse-drag-and-drop-region-cross-program t)
(setq warning-minimum-level :emergency)

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq dired-dwim-target t)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-mouse-drag-files t)

(setq fancy-splash-image (concat doom-private-dir "splash/bluee.png"))
(custom-set-faces!
  '(doom-dashboard-banner :inherit default))

;; (set-frame-parameter (selected-frame) 'alpha '(70 70))
;(set-frame-parameter (selected-frame) 'alpha 90)
;; (add-to-list 'default-frame-alist '(alpha 90 90))
(add-to-list 'default-frame-alist '(alpha-background . 90))
(set-frame-parameter nil 'alpha-background 90)

(setq doom-font (font-spec :family "JetBrains Mono" :size 14 :height 1.0)
      doom-big-font (font-spec :family "JetBrains Mono" :size 16 :height 1.0)
      doom-unicode-font (font-spec :family "JetBrains Mono" :size 14 :height 1.0)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 14 :height 1.1)
      doom-serif-font (font-spec :family "JetBrains Mono" :size 14))
(set-frame-font "JetBrains Mono 12" nil t)

(custom-set-faces!
    '(font-lock-comment-face :slant italic :foreground "#C60606")
    '(font-lock-keyword-face :slant italic)
     '(default :foreground "#00A30A")
     )

(custom-set-faces
  '(mode-line ((t (:family "GoMono Nerd Font Propo" :size 14))))
  '(mode-line-active ((t (:family "GoMono Nerd Font" :size 14))))
  '(mode-line-inactive ((t (:family "GoMono Nerd Font" :size 14)))))

;; (add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
;; (load-theme 'doom-nord t)
(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'doom-dracula)
;; (setq doom-theme 'doom-monokai-pro)
;; (setq doom-theme 'deeper-blue)
;; (setq doom-theme 'catppuccin)
;; (setq doom-theme 'doom-dark+)
;; (setq doom-theme 'doom-moonlight)

(after! doom-themes
    (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
    (doom-themes-org-config)
    (doom-themes-visual-bell-config)
    (doom-themes-neotree-config)
    (doom-themes-treemacs-config))

(after! centaur-tabs
    (centaur-tabs-mode t)
    (setq centaur-tabs-icon-type 'nerd-icons
          centaur-tabs-set-icons t
          centaur-tabs-height 20
          centaur-tabs-set-bar 'over
          centaur-tabs-set-modified-marker t
          centaur-tabs-show-count nil
          centaur-tabs-show-navigation-buttons t)
    (centaur-tabs-change-fonts "NotoSerif Nerd Font" 140)
    (add-hook! 'dired-mode-hook 'centaur-tabs-local-mode)
    (add-hook! 'dirvish-peek-mode (centaur-tabs-mode -1))
    (add-hook! 'gnus-mode-hook (centaur-tabs-mode -1)))
(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                               (kbd "g <down>")  'centaur-tabs-forward-group
                                               (kbd "g <up>")    'centaur-tabs-backward-group)

(map! :leader
      :desc "Comment line" "-" #'comment-line)

(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle line numbers"            "l" #'doom/toggle-line-numbers
       :desc "Toggle truncate lines"          "L" #'toggle-truncate-lines
       :desc "Toggle treemacs"                "t" #'+treemacs/toggle
       :desc "Toggle ghostel"                 "g" #'+ghostel/toggle
       :desc "Toggle neotree"                 "n" #'neotree-toggle
       :desc "open with vsplit neotree"       "N" #'neotree-enter-vertical-split
       :desc "tabs globally"                  "c" #'centaur-tabs-mode
       :desc "tabs locally"                   "C" #'centaur-tabs-loc
       :desc "dirvish side"                   "s" #'dirvish-side
       ))

(setq display-line-numbers-type t)

;; Enable simpleclip globally
(simpleclip-mode 1)
(pixel-scroll-precision-mode 1)
;; Optional: Bind to standard keybindings (Doom uses evil-mode by default)
;; For Evil users, you may need to map these to visual mode.
(map!
 (:v "C-c" #'simpleclip-copy)
 (:v "C-x" #'simpleclip-cut)
 (:i "C-v" #'simpleclip-paste))

(map!
    :m "C-h" #'evil-window-left
    :m "C-j" #'evil-window-down
    :m "C-k" #'evil-window-up
    :m "C-l" #'evil-window-right
    :m "C-w" #'evil-window-vsplit
    :m "C-o" #'evil-window-split
)

(use-package! drag-stuff
  :defer t
  :init

  (drag-stuff-global-mode 1)
  :config
  (drag-stuff-global-mode 1)
  ;; Bind drag-stuff to Alt + hjkl in visual/normal states
  (map! :v "M-h" #'drag-stuff-left
        :v "M-j" #'drag-stuff-down
        :v "M-k" #'drag-stuff-up
        :v "M-l" #'drag-stuff-right
        :n "M-j" #'drag-stuff-down
        :n "M-k" #'drag-stuff-up))

(after! org
  (map! :map org-mode-map
        :v "M-h" #'drag-stuff-left
        :v "M-j" #'drag-stuff-down
        :v "M-k" #'drag-stuff-up
        :v "M-l" #'drag-stuff-right
        :n "M-j" #'drag-stuff-down
        :n "M-k" #'drag-stuff-up))

(after! treemacs
    (setq doom-themes-treemacs-theme "doom-colors")
    (setq doom-themes-treemacs-enable-variable-pitch t)
    (setq treemacs-selected-winning-project (expand-file-name "~/"))
    (setq projectile-project-search-path '(("~/") ("~/projects/")))
    )



(use-package! peep-dired
  :after dired
  :config
  (evil-define-key 'normal dired-mode-map
    (kbd "P") 'peep-dired
    (kbd "j") 'peep-dired-next-file
    (kbd "k") 'peep-dired-prev-file)
(setq peep-dired-cleanup-on-disable t
      peep-dired-ignored-extensions '("mkv" "iso" "mp4")))

(beacon-mode 1)

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
        :desc "Move line(s) up"        :nv "<M-h>"    #'drag-stuff-up
        :desc "Move line(s) down"      :nv "<M-j>"  #'drag-stuff-down
        :desc "Move line(s) left"      :nv "<M-k>"  #'drag-stuff-left
        :desc "Move line(s) right"     :nv "<M-l>" #'drag-stuff-right
        :desc "Go to prev visual line" :n  "<up>"      #'evil-previous-visual-line
        :desc "Go to next visual line" :n  "<down>"    #'evil-next-visual-line)
(after! org
  (add-hook 'org-mode-hook #'smartparens-mode)
  ;; Alternatively, ensure global pairs are strictly enforced in org blocks
  (add-hook 'org-mode-hook #'turn-on-smartparens-strict-mode))

;; Open the source block in a horizontal split (current window divides)
;; (setq org-src-window-setup 'split-window-below)
;; Open the source block in a vertical split
;; (setq org-src-window-setup 'split-window-right)
;; Use the current window completely (hides the org file until you exit)
(setq org-src-window-setup 'current-window)
;; Open in a completely separate frame
;; (setq org-src-window-setup 'other-frame)

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
