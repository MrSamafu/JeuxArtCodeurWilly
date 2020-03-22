using Mirror;
using UnityEngine;

public class PlayerShoot : NetworkBehaviour
{
    public Camera cam;
    public PlayerWeapon weapon;

    public LayerMask mask;
    void Start()
    {
        if(cam == null)
        {
            Debug.LogError("pas de camera référencée");
            this.enabled = false;
        }
    }
    private void Update()
    {
        if (Input.GetButtonDown("Fire1"))
        {
            Shoot();
        }
    }

    [Client]
    private void Shoot()
    {
        RaycastHit _hit;
        if (Physics.Raycast(cam.transform.position, cam.transform.forward, out _hit, weapon.range, mask))
        {
            if(_hit.collider.tag == "Joueur")
            {
                CmdPlayerShoot(_hit.collider.name);
            }
        }
    }

    [Command]
    private void CmdPlayerShoot(string _ID)
    {
        Debug.Log(_ID + " a été touché.");
    }


}
