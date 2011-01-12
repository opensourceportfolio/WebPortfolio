/// <reference path="../jquery-1.4.1.js" />

function enableAddHoldings(holdingMenu, execute, portfolioID) {
    if (portfolioID != "1") {
        holdingMenu.show();
        holdingMenu.find(".linkAddHolding").click(function () {
            var menu = holdingMenu.find(".addTransactionMenu");
            var isHidden = menu.is(":hidden");
            if (isHidden) {
                menu.fadeIn();
                menu.show();
            }
            else {
                menu.fadeOut();
            }

        });

        holdingMenu.find('.datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
        holdingMenu.find('.addTransactionButton').click(function () {
            execute();
        });
    } else {
        holdingMenu.hide();
    }
}

function makeTableSortable(tableName) {
    //make dividend table more friendly
    var rows = $(tableName + " > tbody > tr").length
    if (rows > 0) {
        $(tableName).tablesorter({ widgets: ['zebra'] });
        if ($(".pager").length > 0) {
            $(tableName).tablesorterPager({ container: $(".pager") });
        }

        $(tableName + " tr").hover(function () {
            $(this).addClass("over")
        },
        function () {
            $(this).removeClass("over")
        }
    );
    }
}

function yearsApart(earlier, later) {
    var earlierDate = new Date(earlier);
    var laterDate = new Date(later);
    return (laterDate.getTime() - earlierDate.getTime()) / 31536000000;
}