.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

var db = Sql.LocalStorage.openDatabaseSync("Local Storage Example", "1.0", "Sample database", 100000);

function init() {
    db.transaction(
        function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Settings(id INTEGER PRIMARY KEY,variable TEXT, content TEXT);')
            tx.executeSql('CREATE TABLE IF NOT EXISTS Favorites(id INTEGER PRIMARY KEY, content TEXT);')
            tx.executeSql('CREATE TABLE IF NOT EXISTS Marks(id INTEGER PRIMARY KEY,category TEXT, quote_id INTEGER);')
        }
    )
}

function getRecords(table) {
    var records = []
    var record = {}
    try{
        db.transaction(
        function(tx) {
            var rs = tx.executeSql('SELECT * FROM '+table+';');
            for (var i = 0; i < rs.rows.length; i++) {
                if(table == "Favorites"){
                    record = {
                        id: rs.rows.item(i).id,
                        content: rs.rows.item(i).content
                    }
                }else if(table == "Settings"){
                    record = {
                        id: rs.rows.item(i).id,
                        variable: rs.rows.item(i).variable,
                        content: rs.rows.item(i).content
                    }
                }else{
                    record = {
                        id: rs.rows.item(i).id,
                        category: rs.rows.item(i).category,
                        quote_id: rs.rows.item(i).quote_id
                    }
                }
                records.push(record)
            }
        }
    );}catch(err){
        console.log(err)
    }

    return records
}

function insertIntoFavorites(content) {
    db.transaction(
        function(tx) {
            tx.executeSql('INSERT INTO Favorites VALUES(NULL, ?);', [ content ]);
        }
    );
}
function insertIntoSettings(variable,value){
    db.transaction(
            function(tx){
                tx.executeSql('INSERT INTO Settings VALUES(NULL , ? , ?);',[variable,value]);
            }
          );
}
function storeVariable(variable,value){
    insertIntoSettings(variable,value);

}
function getVariable(variable){
    var records = getRecords("Settings");
    var result = variable === "visit" ? 1 : variable === "isItRated" ? false : "qrc:/images/background.jpg";
    for (var i =records.length-1;i>-1;i--){
        if(records[i].variable === variable){
            result = records[i].content;
            break;
        }
    }
    return result;
}
function insertIntoMarks(category,quote_id){
    var records = getRecords("Marks");
    var check = true;
    for (var i =0;i<records.length;i++){
        if(records[i].category == category && records[i].quote_id==quote_id){
            check = false;
        }
    }
    if(check){
        db.transaction(
                function(tx){
                    tx.executeSql('INSERT INTO Marks VALUES(NULL , ? , ?);',[category,quote_id]);
                }
              );
    }
}

function removeRecord(id,table) {
    db.transaction(
        function(tx) {
            tx.executeSql('DELETE FROM '+table+' WHERE id=?;', [ id ]);
        }
    );
}
