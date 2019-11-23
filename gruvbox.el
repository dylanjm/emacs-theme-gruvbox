;;; gruvbox-dark-theme.el --- A retro-groove colour theme for Emacs -*- lexical-binding: t -*-

;; Copyright (c) 2013 Lee Machin
;; Copyright (c) 2013-2016 Eduardo Lavaque
;; Copyright (c) 2016-2017 Jason Milkins
;; Copyright (c) 2017 Martijn Terpstra

;; Author: Jason Milkins <jasonm23@gmail.com>
;; (current maintainer)
;;
;; Author-list: Lee Machin <ljmachin@gmail.com>,
;;              Eduardo Lavaque <me@greduan.com>
;;
;; URL: http://github.com/greduan/emacs-theme-gruvbox
;; Version: 1.26.0

;; Package-Requires: ((autothemer "0.2"))
;;; Commentary:

;; Using autothemer since 1.00

;; A port of the Gruvbox colorscheme for Vim, built on top of the new built-in
;; theme support in Emacs 24.
;;
;; This theme contains my own modifications and it's a bit opinionated
;; sometimes, deviating from the original because of it. I try to stay
;; true to the original as much as possible, however. I only make
;; changes where I would have made the changes on the original.
;;
;; Since there is no direct equivalent in syntax highlighting from Vim to Emacs
;; some stuff may look different, especially in stuff like JS2-mode, where it
;; adds stuff that Vim doesn't have, in terms of syntax.

;;; Credits:

;; Pavel Pertsev created the original theme for Vim, on which this port
;; is based.

;; Lee Machin created the first port of the original theme, which
;; Greduan developed further adding support for several major modes.
;;
;; Jason Milkins (ocodo) has maintained the theme since 2015 and is
;; working with the community to add further mode support and align
;; the project more closely with Vim Gruvbox.
;;
;; Martijn Terpstra has been a major contributor since mid 2017 and
;; helped to re-implement Gruvbox with autothemer so we can have
;; multiple variants of Gruvbox (as we do on Vim).  Martijn has also
;; provided a large number mode support enhancements.

;;; Code:
(eval-when-compile
  (require 'cl-lib))

(require 'autothemer)

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(defmacro gruvbox-deftheme (name description palette &rest body)
  "Defining the gruvbox theme NAME DESCRIPTION PALETTE BODY."
  `(autothemer-deftheme
    ,name
    ,description
    ,palette

    ((cursor              (:background gruvbox-light0))
     (default             (:background gruvbox-bg :foreground gruvbox-light1))
     (fixed-pitch         (:background gruvbox-bg :foreground gruvbox-light1))
     (fringe              (:background gruvbox-dark0_hard))
     (hl-line             (:background gruvbox-dark1 :extend t))
     (link                (:foreground gruvbox-faded_blue :underline t))
     (minibuffer-prompt   (:background gruvbox-dark0_hard :foreground gruvbox-bright_green :bold t))
     (mode-line           (:inherit 'variable-pitch :background gruvbox-dark0 :foreground gruvbox-light3 :box (:line-width 8 :color gruvbox-dark0) :overline nil :underline (:line-width 3 :color gruvbox-light1)))
     (mode-line-inactive  (:inherit 'variable-pitch :background gruvbox-dark0_hard :foreground gruvbox-light1 :box (:line-width 8 :color gruvbox-dark0_hard) :overline nil :underline (:line-width 3 :color gruvbox-dark0)))
     (region              (:background gruvbox-dark2 :extend t))
     (secondary-selection (:background gruvbox-dark1 :extend t))
     (shadow              (:foreground gruvbox-dark4))
     (vertical-border     (:foreground gruvbox-dark4))
     (window-divider      (:foreground gruvbox-light4))


     ;; Built-in syntax

     (font-lock-builtin-face                            (:foreground gruvbox-bright_orange))
     (font-lock-constant-face                           (:foreground gruvbox-bright_purple))
     (font-lock-comment-face                            (:foreground gruvbox-dark4 :slant 'italic))
     (font-lock-function-name-face                      (:foreground gruvbox-bright_yellow))
     (font-lock-keyword-face                            (:foreground gruvbox-bright_red))
     (font-lock-string-face                             (:foreground gruvbox-bright_green))
     (font-lock-doc-face                                (:foreground gruvbox-bright_green :slant 'italic))
     (font-lock-variable-name-face                      (:foreground gruvbox-bright_blue))
     (font-lock-type-face                               (:foreground gruvbox-bright_purple))
     (font-lock-warning-face                            (:foreground gruvbox-bright_red :bold t))

     ;; Basic faces
     (error                                             (:foreground gruvbox-bright_red :bold t))
     (success                                           (:foreground gruvbox-bright_green :bold t))
     (warning                                           (:foreground gruvbox-bright_yellow :bold t))
     (trailing-whitespace                               (:background gruvbox-bright_red))
     (escape-glyph                                      (:foreground gruvbox-bright_aqua))
     (header-line                                       (:background gruvbox-dark0 :foreground gruvbox-light3 :box nil :inherit nil))
     (highlight                                         (:background gruvbox-dark4 :foreground gruvbox-light0))
     (homoglyph                                         (:foreground gruvbox-bright_yellow))
     (match                                             (:foreground gruvbox-dark0 :background gruvbox-bright_blue))

     ;; Customize faces
     (widget-field                                      (:background gruvbox-dark3))
     (custom-group-tag                                  (:foreground gruvbox-bright_blue :weight 'bold))
     (custom-variable-tag                               (:foreground gruvbox-bright_blue :weight 'bold))

     ;; whitespace-mode
     (whitespace-space                          (:background gruvbox-bg :foreground gruvbox-dark4))
     (whitespace-hspace                         (:background gruvbox-bg :foreground gruvbox-dark4))
     (whitespace-tab                            (:background gruvbox-bg :foreground gruvbox-dark4))
     (whitespace-newline                        (:background gruvbox-bg :foreground gruvbox-dark4))
     (whitespace-trailing                       (:background gruvbox-dark1 :foreground gruvbox-bright_red))
     (whitespace-line                           (:background gruvbox-dark1 :foreground gruvbox-bright_red))
     (whitespace-space-before-tab               (:background gruvbox-bg :foreground gruvbox-dark4))
     (whitespace-indentation                    (:background gruvbox-bg :foreground gruvbox-dark4))
     (whitespace-empty                          (:background nil :foreground nil))
     (whitespace-space-after-tab                (:background gruvbox-bg :foreground gruvbox-dark4))

     ;; RainbowDelimiters

     (rainbow-delimiters-depth-1-face           (:foreground gruvbox-delimiter-one))
     (rainbow-delimiters-depth-2-face           (:foreground gruvbox-delimiter-two))
     (rainbow-delimiters-depth-3-face           (:foreground gruvbox-delimiter-three))
     (rainbow-delimiters-depth-4-face           (:foreground gruvbox-delimiter-four))
     (rainbow-delimiters-depth-5-face           (:foreground gruvbox-delimiter-one))
     (rainbow-delimiters-depth-6-face           (:foreground gruvbox-delimiter-two))
     (rainbow-delimiters-depth-7-face           (:foreground gruvbox-delimiter-three))
     (rainbow-delimiters-depth-8-face           (:foreground gruvbox-delimiter-four))
     (rainbow-delimiters-depth-9-face           (:foreground gruvbox-delimiter-one))
     (rainbow-delimiters-depth-10-face          (:foreground gruvbox-delimiter-two))
     (rainbow-delimiters-depth-11-face          (:foreground gruvbox-delimiter-three))
     (rainbow-delimiters-depth-12-face          (:foreground gruvbox-delimiter-four))
     (rainbow-delimiters-unmatched-face         (:background nil :foreground gruvbox-light0))

     ;; line numbers
     (line-number                               (:foreground gruvbox-dark4 :background gruvbox-dark0))
     (line-number-current-line                  (:foreground gruvbox-bright_orange :background gruvbox-dark1))
     (linum                                     (:foreground gruvbox-dark4 :background gruvbox-dark1))
     (linum-highlight-face                      (:foreground gruvbox-bright_orange :background gruvbox-dark2))
     (linum-relative-current-face               (:foreground gruvbox-bright_orange :background gruvbox-dark2))

     ;; Highlight indentation mode
     (highlight-indentation-current-column-face (:background gruvbox-dark2))
     (highlight-indentation-face                (:background gruvbox-dark1))

     ;; smartparens
     (sp-pair-overlay-face                      (:background gruvbox-dark2))
     (sp-show-pair-match-face                   (:background gruvbox-dark2)) ;; Pair tags highlight
     (sp-show-pair-mismatch-face                (:background gruvbox-bright_red)) ;; Highlight for bracket without pair
     (sp-wrap-overlay-face                     (:inherit 'sp-wrap-overlay-face))
     (sp-wrap-tag-overlay-face                 (:inherit 'sp-wrap-overlay-face))

     ;; elscreen
     (elscreen-tab-background-face              (:background gruvbox-bg :box nil)) ;; Tab bar, not the tabs
     (elscreen-tab-control-face                 (:background gruvbox-dark2 :foreground gruvbox-bright_red :underline nil :box nil)) ;; The controls
     (elscreen-tab-current-screen-face          (:background gruvbox-dark4 :foreground gruvbox-dark0 :box nil)) ;; Current tab
     (elscreen-tab-other-screen-face            (:background gruvbox-dark2 :foreground gruvbox-light4 :underline nil :box nil)) ;; Inactive tab

     ;; ag (The Silver Searcher)
     (ag-hit-face                               (:foreground gruvbox-bright_blue))
     (ag-match-face                             (:foreground gruvbox-bright_red))

     ;; Diffs
     (diff-changed                              (:background nil :foreground gruvbox-light1))
     (diff-added                                (:background nil :foreground gruvbox-bright_green))
     (diff-removed                              (:background nil :foreground gruvbox-bright_red))
     (diff-indicator-changed                    (:inherit 'diff-changed))
     (diff-indicator-added                      (:inherit 'diff-added))
     (diff-indicator-removed                    (:inherit 'diff-removed))

     (js2-warning                               (:underline (:color gruvbox-bright_yellow :style 'wave)))
     (js2-error                                 (:underline (:color gruvbox-bright_red :style 'wave)))
     (js2-external-variable                     (:underline (:color gruvbox-bright_aqua :style 'wave)))
     (js2-jsdoc-tag                             (:background nil :foreground gruvbox-gray  ))
     (js2-jsdoc-type                            (:background nil :foreground gruvbox-light4))
     (js2-jsdoc-value                           (:background nil :foreground gruvbox-light3))
     (js2-function-param                        (:background nil :foreground gruvbox-bright_aqua))
     (js2-function-call                         (:background nil :foreground gruvbox-bright_blue))
     (js2-instance-member                       (:background nil :foreground gruvbox-bright_orange))
     (js2-private-member                        (:background nil :foreground gruvbox-faded_yellow))
     (js2-private-function-call                 (:background nil :foreground gruvbox-faded_aqua))
     (js2-jsdoc-html-tag-name                   (:background nil :foreground gruvbox-light4))
     (js2-jsdoc-html-tag-delimiter              (:background nil :foreground gruvbox-light3))

     ;; popup
     (popup-face                                (:underline nil :foreground gruvbox-light1 :background gruvbox-dark1))
     (popup-menu-mouse-face                     (:underline nil :foreground gruvbox-light0 :background gruvbox-faded_green))
     (popup-menu-selection-face                 (:underline nil :foreground gruvbox-light0 :background gruvbox-faded_green))
     (popup-tip-face                            (:underline nil :foreground gruvbox-light2 :background gruvbox-dark2))

     ;;hi-lock-mode
     (hi-black-b                                (:foreground gruvbox-black :weight 'bold))
     (hi-black-hb                               (:foreground gruvbox-black :weight 'bold :height 1.5))
     (hi-blue                                   (:foreground gruvbox-dark0 :background gruvbox-bright_blue))
     (hi-blue-b                                 (:foreground gruvbox-bright_blue :weight 'bold))
     (hi-green                                  (:foreground gruvbox-dark0 :background gruvbox-bright_green))
     (hi-green-b                                (:foreground gruvbox-bright_green :weight 'bold))
     (hi-pink                                   (:foreground gruvbox-dark0 :background gruvbox-bright_purple))
     (hi-red-b                                  (:foreground gruvbox-bright_red :weight 'bold))
     (hi-yellow                                 (:foreground gruvbox-dark0 :background gruvbox-faded_yellow))

     ;; company-mode
     (company-scrollbar-bg                      (:background gruvbox-dark1))
     (company-scrollbar-fg                      (:background gruvbox-dark0_soft))
     (company-tooltip                           (:background gruvbox-dark0_soft))
     (company-tooltip-annotation                (:foreground gruvbox-bright_green))
     (company-tooltip-annotation-selection      (:inherit 'company-tooltip-annotation))
     (company-tooltip-selection                 (:foreground gruvbox-faded_yellow :background gruvbox-dark1))
     (company-tooltip-common                    (:foreground gruvbox-faded_blue :underline t))
     (company-tooltip-common-selection          (:foreground gruvbox-faded_blue :underline t))
     (company-preview-common                    (:foreground gruvbox-light0))
     (company-preview                           (:background gruvbox-dark_blue))
     (company-preview-search                    (:background gruvbox-turquoise4))
     (company-template-field                    (:foreground gruvbox-black :background gruvbox-bright_yellow))
     (company-echo-common                       (:foreground gruvbox-dark_red))

     ;; diredfl
     (diredfl-date-time (:foreground gruvbox-bright_aqua :weight 'light))
     (diredfl-number (:foreground gruvbox-bright_green))
     (diredfl-symlink (:foreground gruvbox-bright_green))
     (diredfl-no-priv (:foreground gruvbox-light3))
     (diredfl-dir-priv (:foreground gruvbox-bright_blue))
     (diredfl-dir-name (:foreground gruvbox-faded_blue))
     (diredfl-deletion (:foreground gruvbox-dark0_hard :background gruvbox-bright_red))
     (diredfl-read-priv(:foreground gruvbox-bright_purple))
     (diredfl-rare-priv (:foreground gruvbox-bright_purple))
     (diredfl-link-priv (:foreground gruvbox-dark0_hard :background gruvbox-bright_purple))
     (diredfl-flag-mark (:foreground gruvbox-dark0_hard :background gruvbox-faded_yellow :weight 'bold))
     (diredfl-file-name (:foreground gruvbox-light3))
     (diredfl-exec-priv (:foreground gruvbox-bright_green))
     (diredfl-write-priv (:foreground gruvbox-bright_red))
     (diredfl-other-priv (:foreground gruvbox-bright_purple))
     (diredfl-file-suffix (:foreground gruvbox-bright_purple))
     (diredfl-dir-heading (:foreground gruvbox-faded_blue :weight 'bold))
     (diredfl-autofile-name (:foreground gruvbox-light3))
     (diredfl-flag-mark-line (:foreground gruvbox-dark0_hard :background gruvbox-faded_yellow :weight 'bold))
     (diredfl-executable-tag (:foreground gruvbox-bright_purple :weight 'bold))
     (diredfl-ignored-file-name (:foreground gruvbox-dark1))
     (diredfl-deletion-file-name (:foreground gruvbox-dark0_hard :background gruvbox-bright_red))
     (diredfl-tagged-autofile-name (:foreground gruvbox-dark4))
     (diredfl-compressed-file-name (:foreground gruvbox-light3))
     (diredfl-compressed-file-suffix (:foreground gruvbox-bright_orange))

     ;; dired-k
     (dired-k-added (:foreground gruvbox-bright_yellow))
     (dired-k--dummy (:foreground gruvbox-bright_purple))
     (dired-k-ignored (:foreground gruvbox-dark4))
     (dired-k-commited (:foreground gruvbox-bright_green))
     (dired-k-modified (:foreground gruvbox-bright_yellow))
     (dired-k-directory (:foreground gruvbox-faded_aqua))
     (dired-k-untracked (:foreground gruvbox-bright_red))

     ;; tool tips
     (tooltip                                   (:foreground gruvbox-light1 :background gruvbox-dark1))

     ;; term
     (term-color-black                          (:foreground gruvbox-dark2 :background gruvbox-dark1))
     (term-color-blue                           (:foreground gruvbox-bright_blue :background gruvbox-bright_blue))
     (term-color-cyan                           (:foreground gruvbox-bright_aqua :background gruvbox-bright_aqua))
     (term-color-green                          (:foreground gruvbox-bright_green :background gruvbox-bright_green))
     (term-color-magenta                        (:foreground gruvbox-bright_purple :background gruvbox-bright_purple))
     (term-color-red                            (:foreground gruvbox-bright_red :background gruvbox-bright_red))
     (term-color-white                          (:foreground gruvbox-light1 :background gruvbox-light1))
     (term-color-yellow                         (:foreground gruvbox-bright_yellow :background gruvbox-bright_yellow))
     (term-default-fg-color                     (:foreground gruvbox-light0))
     (term-default-bg-color                     (:background gruvbox-bg))

     ;; message-mode
     (message-header-to                         (:inherit 'font-lock-variable-name-face))
     (message-header-cc                         (:inherit 'font-lock-variable-name-face))
     (message-header-subject                    (:foreground gruvbox-bright_orange :weight 'bold))
     (message-header-newsgroups                 (:foreground gruvbox-bright_yellow :weight 'bold))
     (message-header-other                      (:inherit 'font-lock-variable-name-face))
     (message-header-name                       (:inherit 'font-lock-keyword-face))
     (message-header-xheader                    (:foreground gruvbox-faded_blue))
     (message-separator                         (:inherit 'font-lock-comment-face))
     (message-cited-text                        (:inherit 'font-lock-comment-face))
     (message-mml                               (:foreground gruvbox-faded_green :weight 'bold))


     ;; org-mode
     (org-hide                                  (:foreground gruvbox-dark0))
     (org-level-1                               (:foreground gruvbox-bright_blue :extend t))
     (org-level-2                               (:foreground gruvbox-bright_yellow))
     (org-level-3                               (:foreground gruvbox-bright_purple))
     (org-level-4                               (:foreground gruvbox-bright_red))
     (org-level-5                               (:foreground gruvbox-bright_green))
     (org-level-6                               (:foreground gruvbox-bright_aqua))
     (org-level-7                               (:foreground gruvbox-faded_blue))
     (org-level-8                               (:foreground gruvbox-bright_orange))
     (org-special-keyword                       (:inherit 'font-lock-comment-face))

     (org-column                                (:background gruvbox-dark0))
     (org-column-title                          (:background gruvbox-dark0 :underline t :weight 'bold))
     (org-warning                               (:foreground gruvbox-bright_red :weight 'bold :underline nil :bold t))
     (org-archived                              (:foreground gruvbox-light0 :weight 'bold))
     (org-link                                  (:foreground gruvbox-faded_aqua :background nil :underline t))
     (org-footnote                              (:foreground gruvbox-bright_aqua :underline t))
     (org-ellipsis                              (:foreground gruvbox-light4))
     (org-date                                  (:foreground gruvbox-bright_blue :underline t))
     (org-sexp-date                             (:foreground gruvbox-faded_blue :underline t))
     (org-list-dt                               (:bold t :weight 'bold))

     (org-formula                               (:inherit 'fixed-pitch :foreground gruvbox-bright_yellow :background gruvbox-dark0))
     (org-document-title                        (:foreground gruvbox-faded_blue))
     (org-document-info                         (:foreground gruvbox-faded_blue))
     (org-agenda-structure                      (:inherit 'font-lock-comment-face))
     (org-agenda-date-today                     (:foreground gruvbox-light0 :weight 'bold :italic t))
     (org-scheduled                             (:foreground gruvbox-bright_yellow))
     (org-time-grid                             (:foreground gruvbox-faded_orange))
     (org-latex-and-related                     (:foreground gruvbox-bright_blue))
     (org-quote                                 (:background gruvbox-dark0_soft :foreground gruvbox-bright_yellow :extend t))

     (org-scheduled-today                       (:inherit 'fixed-pitch :foreground gruvbox-bright_blue))
     (org-scheduled-previously                  (:inherit 'fixed-pitch :foreground gruvbox-faded_red))
     (org-upcoming-deadline                     (:inherit 'fixed-pitch))
     (org-deadline-announce                     (:inherit 'fixed-pitch :foreground gruvbox-faded_red))
     (org-todo                                  (:inherit 'fixed-pitch :foreground gruvbox-bright_red :weight 'bold :bold t))
     (org-done                                  (:inherit 'fixed-pitch :foreground gruvbox-bright_aqua :weight 'bold :bold t))
     (org-drawer                                (:inherit 'fixed-pitch))
     (org-agenda-done                           (:inherit 'fixed-pitch :foreground gruvbox-bright_aqua))
     (org-headline-done                         (:foreground gruvbox-bright_aqua))
     (org-block                                 (:inherit 'fixed-pitch))
     (org-code                                  (:inherit ('shadow 'fixed-pitch)))
     (org-document-info-keyword                 (:inherit ('shadow 'fixed-pitch)))
     (org-indent                                (:inherit ('org-hide 'fixed-pitch)))
     (org-meta-line                             (:inherit ('font-lock-comment-face 'fixed-pitch)))
     (org-property-value                        (:inherit 'fixed-pitch))
     (org-special-keyword                       (:inherit ('font-lock-comment-face 'fixed-pitch)))
     (org-table                                 (:inherit 'fixed-pitch :foreground gruvbox-faded_blue :background gruvbox-dark0))
     (org-tag                                   (:inherit ('shadow 'fixed-pitch) :weight 'bold))
     (org-verbatim                              (:inherit ('shadow 'fixed-pitch)))
     (org-block-begin-line                      (:inherit ('font-lock-comment-face 'fixed-pitch) :background gruvbox-dark0_hard :foreground gruvbox-dark4 :extend t))
     (org-block-end-line                        (:inherit ('font-lock-comment-face 'fixed-pitch) :background gruvbox-dark0_hard :foreground gruvbox-dark4 :extend t))



     ;; org-habit
     (org-habit-clear-face                      (:background gruvbox-faded_blue))
     (org-habit-clear-future-face               (:background gruvbox-bright_blue))
     (org-habit-ready-face                      (:background gruvbox-faded_green))
     (org-habit-ready-future-face               (:background gruvbox-bright_green))
     (org-habit-alert-face                      (:background gruvbox-faded_yellow))
     (org-habit-alert-future-face               (:background gruvbox-bright_yellow))
     (org-habit-overdue-face                    (:background gruvbox-faded_red))
     (org-habit-overdue-future-face             (:background gruvbox-bright_red))

     ;; elfeed
     (elfeed-search-title-face                  (:foreground gruvbox-gray  ))
     (elfeed-search-unread-title-face           (:foreground gruvbox-light0))
     (elfeed-search-date-face                   (:inherit 'font-lock-builtin-face :underline t))
     (elfeed-search-feed-face                   (:inherit 'font-lock-variable-name-face))
     (elfeed-search-tag-face                    (:inherit 'font-lock-keyword-face))
     (elfeed-search-last-update-face            (:inherit 'font-lock-comment-face))
     (elfeed-search-unread-count-face           (:inherit 'font-lock-comment-face))
     (elfeed-search-filter-face                 (:inherit 'font-lock-string-face))

     ;; smart-mode-line
     (sml/modes                                 (:foreground gruvbox-light2 :weight 'bold))
     (sml/minor-modes                           (:foreground gruvbox-light4))
     (sml/filename                              (:foreground gruvbox-bright_yellow :weight 'bold :bold t))
     (sml/prefix                                (:foreground gruvbox-faded_blue))
     (sml/git                                   (:inherit 'sml/prefix))
     (sml/process                               (:inherit 'sml/prefix))
     (sml/sudo                                  (:foreground gruvbox-bright_orange :weight 'bold))
     (sml/read-only                             (:foreground gruvbox-faded_red :weight 'bold))
     (sml/outside-modified                      (:foreground gruvbox-bright_yellow :weight 'bold))
     (sml/modified                              (:foreground gruvbox-bright_purple :weight 'bold))
     (sml/vc                                    (:foreground gruvbox-faded_green))
     (sml/vc-edited                             (:foreground gruvbox-bright_green))
     (sml/charging                              (:foreground gruvbox-faded_aqua))
     (sml/discharging                           (:foreground gruvbox-faded_aqua :weight 'bold))
     (sml/col-number                            (:foreground gruvbox-light4 :weight 'ultra-light))
     (sml/line-number                           (:foreground gruvbox-light4 :weight 'ultra-light))
     (sml/position-percentage                   (:foreground gruvbox-light4 :weight 'ultra-light))

     ;; powerline
     (powerline-active0                         (:background gruvbox-dark4 :foreground gruvbox-light0))
     (powerline-active1                         (:background gruvbox-dark3 :foreground gruvbox-light0))
     (powerline-active2                         (:background gruvbox-dark2 :foreground gruvbox-light0))
     (powerline-inactive0                       (:background gruvbox-dark2 :foreground gruvbox-light4))
     (powerline-inactive1                       (:background gruvbox-dark1 :foreground gruvbox-light4))
     (powerline-inactive2                       (:background gruvbox-dark0 :foreground gruvbox-light4))

     ;; isearch
     (isearch                                   (:foreground gruvbox-black :background gruvbox-bright_orange))
     (lazy-highlight                            (:foreground gruvbox-black :background gruvbox-bright_yellow))
     (isearch-fail                              (:foreground gruvbox-light0 :background gruvbox-bright_red))

     ;; markdown-mode
     (markdown-header-face-1                    (:foreground gruvbox-bright_blue))
     (markdown-header-face-2                    (:foreground gruvbox-bright_yellow))
     (markdown-header-face-3                    (:foreground gruvbox-bright_purple))
     (markdown-header-face-4                    (:foreground gruvbox-bright_red))
     (markdown-header-face-5                    (:foreground gruvbox-bright_green))
     (markdown-header-face-6                    (:foreground gruvbox-bright_aqua))

     ;; anzu-mode
     (anzu-mode-line                            (:foreground gruvbox-bright_yellow :weight 'bold))
     (anzu-match-1                              (:background gruvbox-bright_green))
     (anzu-match-2                              (:background gruvbox-faded_yellow))
     (anzu-match-3                              (:background gruvbox-aquamarine4))
     (anzu-replace-to                           (:foreground gruvbox-bright_yellow))
     (anzu-replace-highlight                    (:inherit 'isearch))

     ;; ace-jump-mode
     (ace-jump-face-background                  (:foreground gruvbox-light4 :background gruvbox-bg :inverse-video nil))
     (ace-jump-face-foreground                  (:foreground gruvbox-bright_red :background gruvbox-bg :inverse-video nil))

     ;; ace-window
     (aw-background-face                        (:forground  gruvbox-light1 :background gruvbox-bg :inverse-video nil))
     (aw-leading-char-face                      (:foreground gruvbox-bright_red :background gruvbox-bg :height 4.0))

     ;; show-paren
     (show-paren-match                          (:background gruvbox-dark3 :foreground gruvbox-bright_blue  :weight 'bold))
     (show-paren-mismatch                       (:background gruvbox-bright_red :foreground gruvbox-dark3 :weight 'bold))

     ;; ivy
     (ivy-current-match                         (:foreground gruvbox-light0 :weight 'bold :underline t))
     (ivy-minibuffer-match-face-1               (:foreground gruvbox-bright_orange))
     (ivy-minibuffer-match-face-2               (:foreground gruvbox-bright_yellow))
     (ivy-minibuffer-match-face-3               (:foreground gruvbox-faded_orange))
     (ivy-minibuffer-match-face-4               (:foreground gruvbox-faded_yellow))
     (ivy-confirm-face                          (:foreground gruvbox-bright_green))
     (ivy-match-required-face                   (:foreground gruvbox-bright_red))
     (ivy-remote                                (:foreground gruvbox-faded_blue))
     (ivy-minibuffer-match-highlight            (:inherit nil :foreground gruvbox-faded_orange :background gruvbox-dark0))
     (ivy-highlight-face                        (:inherit nil :foreground gruvbox-faded_orange :background gruvbox-dark0))
     (ivy-posframe-border (:background gruvbox-dark0_hard))

     ;; swiper
     (swiper-line-face                (:foreground gruvbox-dark0_hard :background gruvbox-faded_yellow :extend t))
     (swiper-match-face-4             (:foreground gruvbox-dark0_hard :background gruvbox-bright_green :bold t))
     (swiper-match-face-3             (:foreground gruvbox-dark0_hard :background gruvbox-bright_aqua :bold))
     (swiper-match-face-2             (:foreground gruvbox-dark0_hard :background gruvbox-bright_orange :bold t))
     (swiper-match-face-1             (:foreground gruvbox-dark0_hard :background gruvbox-bright_blue :bold t))

     ;; ido
     (ido-only-match                            (:foreground gruvbox-faded_green))
     (ido-first-match                           (:foreground gruvbox-faded_green))
     (ido-subdir                                (:foreground gruvbox-faded_red))

     ;; magit
     (magit-bisect-bad                          (:foreground gruvbox-faded_red))
     (magit-bisect-good                         (:foreground gruvbox-faded_green))
     (magit-bisect-skip                         (:foreground gruvbox-faded_yellow))
     (magit-blame-heading                       (:foreground gruvbox-light0 :background gruvbox-dark2))
     (magit-branch-local                        (:foreground gruvbox-bright_blue))
     (magit-branch-current                      (:underline gruvbox-bright_blue :inherit 'magit-branch-local))
     (magit-branch-remote                       (:foreground gruvbox-bright_green))
     (magit-cherry-equivalent                   (:foreground gruvbox-bright_purple))
     (magit-cherry-unmatched                    (:foreground gruvbox-bright_aqua))
     (magit-diff-base                           (:background gruvbox-faded_yellow :foreground gruvbox-light2))
     (magit-diff-added-highlight                (:foreground gruvbox-bright_green :inherit 'magit-diff-context-highlight :extend t))
     (magit-diff-added                          (:foreground gruvbox-bright_green :extend t))
     (magit-diff-base-highlight                 (:background gruvbox-faded_yellow :foreground gruvbox-light0 :extend t))
     (magit-diff-context                        (:foreground gruvbox-dark1  :foreground gruvbox-light1 :extend t))
     (magit-diff-context-highlight              (:background gruvbox-dark1 :foreground gruvbox-light0 :extend t))
     (magit-diff-file-heading                   (:extend t))
     (magit-diff-file-heading-highlight         (:extend t))
     (magit-diff-file-heading-selection         (:extend t))
     (magit-diff-our-highlight                  (:extend t))
     (magit-diff-their-hightlight               (:extend t))
     (magit-diff-whitespace-warning             (:extend t))
     (magit-diff-conlict-heading                (:extend t))
     (magit-section-secondary-heading           (:extend t))
     (magit-diff-hunk-heading                   (:background gruvbox-dark3 :foreground gruvbox-light2 :extend t))
     (magit-diff-hunk-heading-highlight         (:background gruvbox-dark2 :foreground gruvbox-light0 :extend t))
     (magit-diff-hunk-heading-selection         (:background gruvbox-dark2 :foreground gruvbox-bright_orange :extend t))
     (magit-diff-hunk-region                    (:background gruvbox-dark4 :foreground gruvbox-light0 :extend t))
     (magit-diff-lines-heading                  (:background gruvbox-faded_orange :foreground gruvbox-light0 :extend t))
     (magit-diff-lines-boundary                 (:background gruvbox-faded_orange :foreground gruvbox-light0 :extend t))
     (magit-diff-removed                        (:foreground gruvbox-bright_red :extend t))
     (magit-diff-removed-highlight              (:foreground gruvbox-bright_red :inherit 'magit-diff-context-highlight :extend t))
     (magit-diffstat-added                      (:foreground gruvbox-faded_green :extend t))
     (magit-diffstat-removed                    (:foreground gruvbox-faded_red :extend t))
     (magit-section-heading-selection           (:foreground gruvbox-faded_yellow :extend t))
     (magit-section-highlight                   (:background gruvbox-dark1 :extend t))
     (magit-section-heading                     (:foreground gruvbox-bright_yellow :weight 'bold :extend t))
     (magit-dimmed                              (:foreground gruvbox-dark4))
     (magit-hash                                (:foreground gruvbox-bright_blue))
     (magit-log-author                          (:foreground gruvbox-bright_red))
     (magit-log-date                            (:foreground gruvbox-bright_aqua))
     (magit-log-graph                           (:foreground gruvbox-dark4))
     (magit-process-ng                          (:foreground gruvbox-bright_red :weight 'bold))
     (magit-process-ok                          (:foreground gruvbox-bright_green :weight 'bold))
     (magit-reflog-amend                        (:foreground gruvbox-bright_purple))
     (magit-reflog-checkout                     (:foreground gruvbox-bright_blue))
     (magit-reflog-cherry-pick                  (:foreground gruvbox-bright_green))
     (magit-reflog-commit                       (:foreground gruvbox-bright_green))
     (magit-reflog-merge                        (:foreground gruvbox-bright_green))
     (magit-reflog-other                        (:foreground gruvbox-bright_aqua))
     (magit-reflog-rebase                       (:foreground gruvbox-bright_purple))
     (magit-reflog-remote                       (:foreground gruvbox-bright_blue))
     (magit-reflog-reset                        (:foreground gruvbox-bright_red))
     (magit-refname                             (:foreground gruvbox-light4))
     (magit-sequence-drop                       (:foreground gruvbox-faded_yellow))
     (magit-sequence-head                       (:foreground gruvbox-bright_aqua))
     (magit-sequence-part                       (:foreground gruvbox-bright_yellow))
     (magit-sequence-stop                       (:foreground gruvbox-bright_green))
     (magit-signature-bad                       (:foreground gruvbox-bright_red :weight 'bold))
     (magit-signature-error                     (:foreground gruvbox-bright_red))
     (magit-signature-expired                   (:foreground gruvbox-bright_orange))
     (magit-signature-good                      (:foreground gruvbox-bright_green))
     (magit-signature-revoked                   (:foreground gruvbox-bright_purple))
     (magit-signature-untrusted                 (:foreground gruvbox-bright_blue))
     (magit-tag                                 (:foreground gruvbox-bright_yellow))

     ;; git-gutter
     (git-gutter:modified                       (:background gruvbox-faded_blue :foreground gruvbox-faded_blue))
     (git-gutter:added                          (:background gruvbox-faded_green :foreground gruvbox-faded_green))
     (git-gutter:deleted                        (:background gruvbox-faded_red :foreground gruvbox-faded_red))

     ;; git-gutter+
     (git-gutter+-modified                      (:foreground gruvbox-faded_blue :background gruvbox-faded_blue))
     (git-gutter+-added                         (:foreground gruvbox-faded_green :background gruvbox-faded_green))
     (git-gutter+-deleted                       (:foreground gruvbox-faded_red :background gruvbox-faded_red))

     ;; git-gutter-fringe
     (git-gutter-fr:modified                    (:inherit 'git-gutter:modified))
     (git-gutter-fr:added                       (:inherit 'git-gutter:added))
     (git-gutter-fr:deleted                     (:inherit 'git-gutter:deleted))

     ;; diff-hl
     (diff-hl-change (:background gruvbox-faded_blue :foreground gruvbox-faded_blue))
     (diff-hl-delete (:background gruvbox-faded_red :foreground gruvbox-faded_red))
     (diff-hl-insert (:background gruvbox-faded_green :foreground gruvbox-faded_green))

     ;; flyspell
     (flyspell-duplicate                        (:underline (:color gruvbox-light4 :style 'line)))
     (flyspell-incorrect                        (:underline (:color gruvbox-bright_red :style 'line)))

     ;; langtool
     (langtool-errline                          (:foreground gruvbox-dark0 :background gruvbox-bright_red))
     (langtool-correction-face                  (:foreground gruvbox-bright_yellow :weight 'bold))

     ;; latex
     (font-latex-bold-face                      (:foreground gruvbox-faded_green :bold t))
     (font-latex-italic-face                    (:foreground gruvbox-bright_green :underline t))
     (font-latex-math-face                      (:foreground gruvbox-light3))
     (font-latex-script-char-face               (:foreground gruvbox-faded_aqua))
     (font-latex-sectioning-5-face              (:foreground gruvbox-bright_yellow :bold t))
     (font-latex-sedate-face                    (:foreground gruvbox-light4))
     (font-latex-string-face                    (:foreground gruvbox-bright_orange))
     (font-latex-verbatim-face                  (:foreground gruvbox-light4))
     (font-latex-warning-face                   (:foreground gruvbox-bright_red :weight 'bold))
     (preview-face                              (:background gruvbox-dark1))

     ;; mu4e
     (mu4e-header-key-face                      (:foreground gruvbox-bright_green :weight 'bold ))
     (mu4e-unread-face                          (:foreground gruvbox-bright_blue :weight 'bold ))
     (mu4e-highlight-face                       (:foreground gruvbox-bright_green))

     ;; shell script
     (sh-quoted-exec                            (:foreground gruvbox-bright_purple))
     (sh-heredoc                                (:foreground gruvbox-bright_orange))

     ;; undo-tree
     (undo-tree-visualizer-active-branch-face   (:foreground gruvbox-light0))
     (undo-tree-visualizer-current-face         (:foreground gruvbox-bright_red))
     (undo-tree-visualizer-default-face         (:foreground gruvbox-dark4))
     (undo-tree-visualizer-register-face        (:foreground gruvbox-bright_yellow))
     (undo-tree-visualizer-unmodified-face      (:foreground gruvbox-bright_aqua))

     ;; widget faces
     (widget-button-pressed-face                (:foreground gruvbox-bright_red))
     (widget-documentation-face                 (:foreground gruvbox-faded_green))
     (widget-field                              (:foreground gruvbox-light0 :background gruvbox-dark2))
     (widget-single-line-field                  (:foreground gruvbox-light0 :background gruvbox-dark2))

     ;; eshell
     (eshell-prompt-face                         (:foreground gruvbox-bright_aqua))
     (eshell-ls-archive-face                     (:foreground gruvbox-light3))
     (eshell-ls-backup-face                      (:foreground gruvbox-light4))
     (eshell-ls-clutter-face                     (:foreground gruvbox-bright_orange :weight 'bold))
     (eshell-ls-directory-face                   (:foreground gruvbox-bright_yellow))
     (eshell-ls-executable-face                  (:weight 'bold))
     (eshell-ls-missing-face                     (:foreground gruvbox-bright_red :bold t))
     (eshell-ls-product-face                     (:foreground gruvbox-faded_red))
     (eshell-ls-readonly-face                    (:foreground gruvbox-light2))
     (eshell-ls-special-face                     (:foreground gruvbox-bright_yellow :bold t))
     (eshell-ls-symlink-face                     (:foreground gruvbox-bright_red))
     (eshell-ls-unreadable-face                  (:foreground gruvbox-bright_red :bold t))

     ;; tabbar
     (tabbar-default                             (:foreground gruvbox-light0 :background gruvbox-dark3 :bold nil :height 1.0 :box (:line-width -5 :color gruvbox-dark3)))
     (tabbar-separator                           (:foreground gruvbox-light0 :background gruvbox-dark3))
     (tabbar-highlight                           (:inherit 'highlight))
     (tabbar-button                              (:foreground gruvbox-dark3 :background gruvbox-dark3 :box nil :line-width 0))
     (tabbar-button-highlight                    (:inherit 'tabbar-button :inverse-video t))
     (tabbar-modified                            (:foreground gruvbox-bright_green :background gruvbox-dark3 :box (:line-width -5 :color gruvbox-dark3)))
     (tabbar-unselected                          (:inherit 'tabbar-default))
     (tabbar-unselected-modified                 (:inherit 'tabbar-modified))
     (tabbar-selected                            (:inherit 'tabbar-default :foreground gruvbox-bright_yellow))
     (tabbar-selected-modified                   (:inherit 'tabbar-selected))

     ;; wgrep
     (wgrep-delete-face                          (:strike-through gruvbox-bright_red))
     (wgrep-done-face                            (:foreground gruvbox-turquoise4))
     (wgrep-face                                 (:underline (:color gruvbox-bright_yellow :style 'line)))
     (wgrep-file-face                            (:inherit 'highlight))
     (wgrep-reject-face                          (:foreground gruvbox-bright_red :bold t))

     ;; hydra
     (hydra-face-red (:foreground gruvbox-bright_red :weight 'bold))
     (hydra-face-blue (:foreground gruvbox-bright_blue :weight 'bold))
     (hydra-face-amaranth (:foreground gruvbox-bright_yellow :weight 'bold))
     (hydra-face-pink (:foreground gruvbox-bright_purple :weight 'bold))
     (hydra-face-teal (:foreground gruvbox-bright_aqua :weight 'bold))

     ;; which-function-mode
     (which-func                                 (:foreground gruvbox-faded_blue))

     ;; auto-dim-other-buffers
     (auto-dim-other-buffers-face                (:background gruvbox-bg_inactive))

     ;; flycheck
     (flycheck-warning                          (:underline (:style 'wave :color gruvbox-bright_yellow)))
     (flycheck-error                            (:underline (:style 'wave :color gruvbox-bright_red)))
     (flycheck-info                             (:underline (:style 'wave :color gruvbox-bright_blue)))
     (flycheck-fringe-warning                   (:foreground gruvbox-bright_yellow))
     (flycheck-fringe-error                     (:foreground gruvbox-bright_red))
     (flycheck-fringe-info                      (:foreground gruvbox-bright_blue))
     (flycheck-error-list-warning               (:foreground gruvbox-bright_yellow :bold t))
     (flycheck-error-list-error                 (:foreground gruvbox-bright_red :bold t))
     (flycheck-error-list-info                  (:foreground gruvbox-bright_blue :bold t))

     )
    ,@body))

(provide 'gruvbox)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; gruvbox.el ends here
