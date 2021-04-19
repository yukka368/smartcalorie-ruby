
//検索機能
$(function(){
    $('#submit').click(function(){
        $ajax({
            url: "search_recipes_path",
            type: "GET",
            dataType: "text",
            data: {
                name: $(".name").val(),
                num: $(".quantity").val()
            }
        })
        .done(function(data){
            console.log(date)//確認
            $('#result').append(data);

            //ここの処理でフロント側にどのように返すかを設定できる！！
            const json_string = JSON.parse(data);//jsonから配列にパースする
            console.log(json_string)//確認
            var $name = $('<p />').append(json_string.name);
            var $calories = $('<p />').append(json_string.calories);
        })
        
        .fail(function(){
            alert('通信失敗');
        });
    });
    
});