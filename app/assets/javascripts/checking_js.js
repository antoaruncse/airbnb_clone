
function calculate_search()
{	
	var today = new Date();
	var dd = today.getDate();
	var check_in=document.getElementById("check_in_date").value;
	var check_out=document.getElementById("check_out_date").value; 
	conv_value=(1000 * 60 * 60 * 24);
	no_days=(new Date(check_out)-new Date(check_in))/ conv_value;
	if( ( (today.toJSON().slice(0,10) > new Date(check_in).toJSON().slice(0,10) ) || (today.toJSON().slice(0,10) > new Date(check_out).toJSON().slice(0,10) ) ))
		{
			alert (" Please select valid date");
			return false;

		}	 
	else 
		{
				
			if(no_days >=0 )
				{

					return true;
				}
			else
				{			
					alert (" Please select valid date ");
					return false;
				}
		}
}
