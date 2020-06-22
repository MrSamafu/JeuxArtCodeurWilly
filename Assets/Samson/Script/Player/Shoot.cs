using UnityEngine;

public class Shoot : MonoBehaviour
{
    public float damage = 10f;
    public float range = 100f;
    public int force = 50;
    public Cinemachine.CinemachineVirtualCamera cam;
    public Transform gun;
    public GameObject Ammo;
    public AudioClip SoundFire;
    public GameObject exitSocket;
    public GameObject ammoSocket;


    // Update is called once per frame
    void Update()
    { 
        Debug.DrawRay(gun.transform.position, gun.transform.forward, Color.red);
        if (Input.GetButtonDown("Fire1"))
        {
            if(GeneralSetting.bullets > 0)
            {
                GetComponent<AudioSource>().PlayOneShot(SoundFire);
                Shooting();
                GeneralSetting.bullets = GeneralSetting.bullets - 1;
            }
           
        } 
    }
    void Shooting()
    {
        RaycastHit hit;
        if(Physics.Raycast(gun.transform.position, gun.transform.forward, out hit, range))
        {
           
            
        }
        GameObject Bullet = Instantiate(Ammo, transform.position, Quaternion.identity) as GameObject;
        Bullet.GetComponent<Rigidbody>().velocity = transform.forward * force;
        GameObject Socket = Instantiate(ammoSocket, exitSocket.transform.position, Quaternion.identity);
        Socket.GetComponent<Rigidbody>().velocity = exitSocket.transform.forward * 1;
    }
}
