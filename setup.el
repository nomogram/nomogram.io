(setq org-html-doctype "html5"
      org-publish-use-timestamps-flag nil
      org-html-html5-fancy t
      org-export-date-timestamp-format "%A %e %B %Y"
      org-html-preamble-format '(("en" "<div id='header'><a href='http://www.nomogram.io'><img src='nomo.png' /></a></div><div class='centre'><p>%d</p></div>"))
      org-html-postamble-format '(("en" "<div id='disqus_thread'></div>
    <script type='text/javascript'>
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'klltkr'; // required: replace example with your forum shortname

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href='http://disqus.com/?ref_noscript'>comments powered by Disqus.</a></noscript>
    <a href='http://disqus.com' class='dsq-brlink'>comments powered by <span class='logo-disqus'>Disqus</span></a>
<a href='./index.html'>Blog index</a>"))
      org-html-head-extra "<link rel='stylesheet' href='style.css' /><script src='//use.typekit.net/ubv3gvw.js' type='text/javascript'></script><script type='text/javascript'>try{Typekit.load();}catch(e){}</script>"
      org-blog-export-keywords t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))

(setq org-publish-project-alist
      '(("nomo-local-static"
	 :base-directory "~/nomogram.io"
	 :base-extension "html\\|svg\\|css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment)
	("nomo-local-dynamic"
         :base-directory "~/nomogram.io/blog"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory "~/public_html/blog/"
         :publishing-function (org-html-publish-to-html)
	 :auto-sitemap t
	 :sitemap-sort-files anti-chronologically
	 :sitemap-title "Blog index"
	 :sitemap-filename "index.org"
	 :sitemap-sans-extension t
	 :section-numbers nil
	 :with-date t
         :html-preamble t
         :html-postamble t)
	("nomo-local" :components ("nomo-local-static" "nomo-local-dynamic"))
	("nomogram.io-static"
	 :base-directory "~/nomogram.io"
	 :base-extension "html\\|svg\\|css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory nomogram-server
	 :recursive t
	 :publishing-function org-publish-attachment)
	("nomogram.io-dynamic"
         :base-directory "~/nomogram.io/blog"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory (concat nomogram-server "blog/")
         :publishing-function (org-html-publish-to-html)
	 :auto-sitemap t
	 :sitemap-sort-files anti-chronologically
	 :sitemap-title "Blog index"
	 :sitemap-filename "index.org"
	 :sitemap-sans-extension t
	 :section-numbers nil
	 :with-date t
         :html-preamble t
         :html-postamble t)
	("nomogram.io" :components ("nomogram.io-static" "nomogram.io-dynamic"))))
