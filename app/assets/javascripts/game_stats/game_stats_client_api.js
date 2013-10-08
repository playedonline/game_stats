// Cookie Handling code
function createCookie(name, value, days) {

    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + encodeURIComponent(value) + expires + "; path=/";
}

var GameStats = {

    record_impressions: function (game_id, similar_game_ids) {
        $.ajax({url: "/game_stats/record_impressions", type: "post", async: false, data: {game_id: game_id, similar_games_ids: similar_game_ids}});
    },

    record_click: function (game_id, similar_game_id) {
        createCookie("click_data", game_id + '|' + similar_game_id);
    }
};


