{include file="overall_header.tpl"}
<form action="admin.php?page=newsfeed" method="post" id="form">

<table width="90%">   
	<tr>
		<th colspan="4">Allopass List</th>
	</tr>
	<tr>
		<td style="width:15%">News ID</td>
		<td style="width:35%"><input type="text" id="code" name="code" value="{$code}" length="11"></td>
		
	</tr>
	<tr>
		<th colspan="4" class="center">
			<input type="submit" value="{$LNG.ml_type_submit}">
		</th>
	</tr></form>
</table>






<table width="90%">  	
	<tr>
		<th colspan="5">NewsFeed List</th>
	</tr>
	<tr>
		<th style="width:4%">NewsFeed ID</th>
		<th style="width:4%">username</th>
		<th style="width:15%">Post {$LNG.ml_date}</th>
		<th>Valid Until</th>
		<th>Accepted</th>
	</tr>
	{foreach $messageList as $messageID => $messageRow}
	<tr data-messageID="{$messageRow.fid}">
		<td><a href="#" class="toggle">{$messageRow.fid}</a></td>
		<td><a href="#" class="toggle">{$messageRow.username}</a></td>
		<td><a href="#" class="toggle">{$messageRow.date}</a></td>
		<td><a href="#" class="toggle">{$messageRow.valid_until}</a></td>
		<td><a href="#" class="toggle">{$messageRow.accepted}</a></td>
	</tr>
	<tr id="contentID{$messageID}" style="display:none;">
		<td colspan="5" style="padding:5px 8px;">           
<table width="90%">
                    <tbody><tr>
                        <th colspan="3">Feed</th>
                    </tr>
                   

	
	
	<tbody>
		
					<tr class="order_table_item">
						<td class="product-name"><small>{$messageRow.message}</small> </td></tr>	</tbody>
						
						

         </tr>
                    
                </tbody></table>
				

               </td>
	</tr>
	{/foreach}
</table>

<script src="scripts/admin/messageList.js"></script>
{include file="overall_footer.tpl"}