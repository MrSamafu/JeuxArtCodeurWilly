using UnityEngine;

public class Shoot : MonoBehaviour
{
    public float damage = 10f;
    public float range = 100f;
    public Cinemachine.CinemachineVirtualCamera cam;
    public Transform gun;
    public GameObject impact;

    // Update is called once per frame
    void Update()
    { 
        Debug.DrawRay(gun.transform.position, gun.transform.forward, Color.red);
        if (Input.GetButtonDown("Fire1"))
        {
           
            Shooting();
        } 
    }
    void Shooting()
    {
        RaycastHit hit;
        if(Physics.Raycast(gun.transform.position, gun.transform.forward, out hit, range))
        {
            Debug.Log(hit.transform.name);
            impact.transform.position = hit.point;
        }
    }
}
