class Timeget{

    GetRequest get;

    Timeget(){
        get = new GetRequest("http://worldtimeapi.org/api/timezone/Europe/Stockholm");
        get.send();
        println("request: " + get.getContent());
    }


    void timegetLondon(){
        get = new GetRequest("http://worldtimeapi.org/api/timezone/Europe/London");
    }

    void timegetStockholm(){
        get = new GetRequest("http://worldtimeapi.org/api/timezone/Europe/Stockholm");
    }

    void timegetAthens(){
        get = new GetRequest("https://worldtimeapi.org/api/timezone/Europe/Athens");
    }

    String getTime(){
        get.send();
        String temp = get.getContent();
        int timeIndex = temp.indexOf("datetime");
        String cityString = temp.substring(temp.indexOf("timezone"),temp.indexOf("unixtime")-3);
        cityString = cityString.substring(cityString.indexOf("/")+1);
        return cityString + " Time = " +temp.substring(timeIndex+22,timeIndex+30);
    }
}