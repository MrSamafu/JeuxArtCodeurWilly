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


    // Update is called once per frame
    void Update()
    { 
        Debug.DrawRay(gun.transform.position, gun.transform.forward, Color.red);
        if (Input.GetButtonDown("Fire1"))
        {
            GetComponent<AudioSource>().PlayOneShot(SoundFire);
            Shooting();
        } 
    }
    void Shooting()
    {
        RaycastHit hit;
        if(Physics.Raycast(gun.transform.position, gun.transform.forward, out hit, range))
        {
            Debug.Log(hit.transform.name);
            
        }
        GameObject Bullet = Instantiate(Ammo, transform.position, Quaternion.identity) as GameObject;
        Bullet.GetComponent<Rigidbody>().velocity = transform.forward * force;
    }
}
