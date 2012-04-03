<?php

    date_default_timezone_set('America/Chicago');

    $wpt_host = 'http://localhost';
    $db = mysql_connect('example.com:5029', 'user', 'password');
    mysql_select_db("wpt", $db);

    $test_id = $_GET['id'];

    $wpt = new SimpleXMLElement(file_get_contents($wpt_host . "/xmlResult/" . $test_id . "/"));
        
    list($name, $mode) = explode(' | ', $wpt->data->label);
    
    function convertToDateTime($timestamp) {
        $dt = new DateTime();
        $dt->setTimestamp($timestamp);
        return $dt->format('Y-m-d H:i:s');
    }
    
    function sqlStrWrap($val) {
        return "'" . mysql_real_escape_string($val) . "'";
    }
    
    function sqlNumWrap($val) {
        return ($val ? $val : 0);
    }
    
    $firstView = $wpt->data->median->firstView;
    $repeatView = $wpt->data->median->repeatView;
    
    $data = array(
        sqlStrWrap($wpt->data->testId),
        sqlStrWrap($wpt->data->location),
        sqlStrWrap($name),
        sqlStrWrap($mode),
        sqlStrWrap($firstView->browser_name),
        sqlStrWrap(convertToDateTime(intval($firstView->date))),
        sqlStrWrap($wpt->data->testUrl),
        sqlNumWrap($firstView->docTime),
        sqlNumWrap($firstView->requestsDoc),
        sqlNumWrap($firstView->bytesInDoc),
        sqlNumWrap($firstView->fullyLoaded),
        sqlNumWrap($firstView->requests),
        sqlNumWrap($firstView->bytesIn),
        sqlNumWrap($repeatView->docTime),
        sqlNumWrap($repeatView->requestsDoc),
        sqlNumWrap($repeatView->bytesInDoc),
        sqlNumWrap($repeatView->fullyLoaded),
        sqlNumWrap($repeatView->requests),
        sqlNumWrap($repeatView->bytesIn)
    );
    
    $sql = 'insert into TestResults (TestID,Location,Label,Mode,Browser,Date,URL,DocTime,DocRequests,DocBytes,FullyLoaded,FullRequests,FullBytes,CachedDocTime,CachedDocRequests,CachedDocBytes,CachedFullyLoaded,CachedFullRequests,CachedFullBytes) values (' . implode(',', $data) . ');';
    print $sql;
    mysql_query($sql);
    mysql_close($db);
?>