;;; help-me.el --- Help me in unfamiliar major modes

;; Copyright (C) 2012  Yuto HAYAMIZU

;; Author: Yuto HAYAMIZU <y.hayamizu@gmail.com>
;; Keywords: help, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Prerequisites:
;;   popup.el: https://github.com/m2ym/popup-el

;;; Code:

(require 'popup)

;; Customization

(defgroup help-me nil
  "HelpMe"
  :group 'help
  :prefix "help-me-")

(defcustom help-me-dictionary
  '((markdown-mode
	 . ("C-c C-t <NUM>		markdown-insert-header-<NUM>")))
  "Describe quick and simple help for each major modes."
  :type '(repeat (cons symbol (list string)))
  :group 'help-me)


;; Variables

(defvar help-me-mode nil
  "Dummy variable to suppress compiler warnings.")

(defvar help-me-mode-map
  (let ((map (make-sparse-keymap)))
	(define-key map (kbd "M-?") 'help-me)
	map)
  "HelpMe mode map.")

;; Define minor mode

(define-minor-mode help-me-mode
  "HelpMe mode"
  :lighter " H!"
  :keymap help-me-mode-map
  :group 'help-me
  (progn
	))

;; Commands

(defun help-me ()
  (interactive)
  (let ((entry (assq major-mode help-me-dictionary)))
	(popup-menu* (cdr entry))))

(provide 'help-me)
;;; help-me.el ends here
