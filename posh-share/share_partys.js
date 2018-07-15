
var clickDelta = 2000; // ms delay between clicks

var poshPartyShare = function() {
    $(this).click();
    $("[data-pa-name^='share_poshmark_poshparty']").click();
};

var notSold = function(el) {
    return $(el).closest('.tile').find('.sold-tag,.sold-out-tag,.not-for-sale-tag').length === 0;
};

function share() {
    var timeout = 0;
    var doShare = function() {
        if (notSold(this)) {
            setTimeout(poshPartyShare.bind(this), timeout);
            timeout += clickDelta;
        }
    };
    
    $('a.share').each(doShare);
};

share();


