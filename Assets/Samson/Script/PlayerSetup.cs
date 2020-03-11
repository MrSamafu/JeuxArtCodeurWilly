using Mirror;
using UnityEngine;

public class PlayerSetup : NetworkBehaviour
{

    public Behaviour[] componentsToDisable;

    private void Start()
    {
        if (!isLocalPlayer)
        {
            //boucle qui desactive les components des autre joueurs.
            for(int i = 0; i < componentsToDisable.Length; i++)
            {
                componentsToDisable[i].enabled = false;

            }
        }
        else
        {
            Camera.main.gameObject.SetActive(false);
            
        }
    }
}
