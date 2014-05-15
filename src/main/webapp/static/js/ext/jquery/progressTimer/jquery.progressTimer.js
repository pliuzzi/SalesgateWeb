(function ($) {
    $.fn.progressTimer = function (options) {
		var settings = $.extend({}, $.fn.progressTimer.defaults, options);
		
		var interval;
		
        this.each(function () {
            $(this).empty();
            var barContainer = $("<div>").addClass("progress active").addClass(settings.navClass);
            var textContainer = $("<div style='position: absolute; width: 90%'>");
            var bar = $("<div>").addClass("progress-bar").addClass(settings.baseStyle)
                .attr("role", "progressbar")
                .attr("aria-valuenow", "0")
                .attr("aria-valuemin", "0")
                .attr("aria-valuemax", settings.timeLimit);
            var text = $("<p style='color:#000000'>").addClass("text-center");
            
            bar.appendTo(barContainer);
            textContainer.appendTo(barContainer);
            barContainer.appendTo($(this));
            text.appendTo(textContainer);
            
            var start = new Date();
            var limit = settings.timeLimit * 1000;
            interval = window.setInterval(function () {
                var elapsed = new Date() - start;
                bar.width(((elapsed / limit) * 100) + "%");
                text.html(settings.textFunction(elapsed, limit));
                if (((elapsed / limit) * 100) >= 80)
                    bar.removeClass(settings.baseStyle)
                       .removeClass(settings.completeStyle)
                       .addClass(settings.warningStyle);

                if (elapsed >= limit) {
                    window.clearInterval(interval);

                    bar.removeClass(settings.baseStyle)
                       .removeClass(settings.warningStyle)
                       .addClass(settings.completeStyle);

                    settings.onFinish.call(this);
                }

            }, 250);

        });

        return interval;
    };

    $.fn.progressTimer.defaults = {
        timeLimit: 60,  //total number of seconds
        warningThreshold: 5,  //seconds remaining triggering switch to warning color
        onFinish: function () {},  //invoked once the timer expires
		baseStyle: '',  //bootstrap progress bar style at the beginning of the timer
		navClass: '',
		textFunction: function (elapsed, limit) {return Math.round(((elapsed / limit) * 100)) + "%"},
        warningStyle: 'progress-bar-danger',  //bootstrap progress bar style in the warning phase
        completeStyle: 'progress-bar-success'  //bootstrap progress bar style at completion of timer
    };
}(jQuery));
