(use-modules (guix channels))

(list (channel
       (name 'nezzar)
       (url "file:///home/paul/nezzar")
       ;; (branch "master")
       (commit #f
        ;; "70b5f4e76607ce00ef2c13af7021423966f28324"
	)
       (branch "devel"))
      (channel
       (name 'nonguix)
       (url "https://gitlab.com/nonguix/nonguix")
       (branch "master")
       (commit
        "17d964fa17d4450058f110bf33a727ca5fe37d4f")
       (introduction
        (make-channel-introduction
         "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
         (openpgp-fingerprint
          "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
      (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (branch "master")
       (commit
        "26565f1bc8548011bc0e1b821a9a957db1bc2d8f")
       (introduction
        (make-channel-introduction
         "9edb3f66fd807b096b48283debdcddccfea34bad"
         (openpgp-fingerprint
          "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
