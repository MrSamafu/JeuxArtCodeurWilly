using Mirror;
using UnityEngine;

public class PlayerSetup : NetworkBehaviour
{

    public Behaviour[] componentsToDisable;
    public string remoteLayerName = "RemotePlayer";
    Camera sceneCamera;
    private void Start()
    {
        if (!isLocalPlayer)
        {
            DisableComponents();
            AssignRemoteLayer();
        }
        else
        {
            sceneCamera = Camera.main;
            if(sceneCamera != null)
            {
                sceneCamera.gameObject.SetActive(false);
            }
            
        }
        RegisterPlayer();


    }
    private void RegisterPlayer()
    {
        string _ID = "Player" + GetComponent<NetworkIdentity>().netId;
        transform.name = _ID;
    }
    private void AssignRemoteLayer()
    {
        gameObject.layer = LayerMask.NameToLayer(remoteLayerName);
    }
    private void DisableComponents()
    {
        //boucle qui desactive les components des autre joueurs.
        for (int i = 0; i < componentsToDisable.Length; i++)
        {
            componentsToDisable[i].enabled = false;

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
