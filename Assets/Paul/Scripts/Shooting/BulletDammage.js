#pragma strict

var Dammage = 100;

function OnCollisionEnter (info : Collision)
{
	info.transform.SendMessage("ApplyDammage", Dammage, SendMessageOptions.DontRequireReceiver);
}