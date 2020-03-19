<cfinclude template="beforecontent.cfm">
<cfquery datasource="HDStreet" name="rsCurrentEvents">
    SELECT [Id], [Name], [Date], [Location], [Venue]
    FROM [Events]
    WHERE [Date] >= #now()#
    ORDER BY [Date] ASC
</cfquery>

<div id="pageBody">
    <div id="calendarContent">
        <h1> Agenda</h1>
        <cfoutput query="rsCurrentEvents">
            <cfif rsCurrentEvents.recordCount EQ 0>
                <p>Sorry, there are no events to display at this time</p>
            <cfelse>
                <table>
                    <tr>
                        <th>#dateFormat(Date, "mmm dd, yyyy")#</th>
                        <td>#Name# - #Location#</td>
                        <td><a href="agenda.cfm">Read More</a></td>
                    </tr>
                </table>
            </cfif>
        </cfoutput>
    </div>
    <div id="calendarSideBar">
        <cfif rsCurrentEvents.recordCount NEQ 0>
            <div id="EventDetails">
                <h1>Next Event</h1>
                <cfoutput>
                    <p id="eventDate"><span id="month">#dateFormat(rsCurrentEvents.Date, "mmm")#</span> <span id="days">#day(rsCurrentEvents.Date)#</span></p>
                    <h2>#rsCurrentEvents.Name#</h2>
                    <p>#rsCurrentEvents.Venue# - #rsCurrentEvents.Location#</p>
                    <p class="alignRight"><a href="agenda.cfm">Read More</a></p>
                </cfoutput>
            </div>
        </cfif>
    </div>
</div>
<cfinclude template="aftercontent.cfm">