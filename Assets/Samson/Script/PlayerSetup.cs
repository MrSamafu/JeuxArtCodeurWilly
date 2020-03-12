using Mirror;
using UnityEngine;

public class PlayerSetup : NetworkBehaviour
{

    public Behaviour[] componentsToDisable;
    Camera sceneCamera;
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
            sceneCamera = Camera.main;
            if(sceneCamera != null)
            {
                sceneCamera.gameObject.SetActive(false);
            }
            
        }
    }

    private void OnDisable()
    {
        if(sceneCamera != null)
        {
            sceneCamera.gameObject.SetActive(true);
        }
    }
}
