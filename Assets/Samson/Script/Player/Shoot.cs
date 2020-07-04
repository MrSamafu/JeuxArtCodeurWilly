using UnityEngine;

public class Shoot : MonoBehaviour
{
    public float damage = 10f;
    public float range = 100f;
    public int force = 10000;
    public Cinemachine.CinemachineVirtualCamera cam;
    public Transform gun;
    public GameObject Ammo;
    public AudioClip SoundFire;
    public GameObject exitSocket;
    public GameObject ammoSocket;
    public GameObject Impact;

    private ParticleSystem muzzleFlash;


    private void Start()
    {
        muzzleFlash = GetComponentInChildren<ParticleSystem>();
    }
    void Update()
    { 
        Debug.DrawRay(cam.transform.position, cam.transform.forward, Color.red);
        if (Input.GetButtonDown("Fire1"))
        {
            if(GeneralSetting.bullets > 0)
            {
                muzzleFlash.Play();
                GetComponent<AudioSource>().PlayOneShot(SoundFire);
                Shooting();
                GeneralSetting.bullets = GeneralSetting.bullets - 1;
            }
           
        } 
    }
    void Shooting()
    {
        RaycastHit hit;
        if(Physics.Raycast(cam.transform.position, cam.transform.forward, out hit, range))
        {
            Debug.Log(hit.transform.gameObject);

            EnemyVariable target = hit.transform.GetComponent<EnemyVariable>();
            if(target != null)
            {
                target.Touch(damage);
            }
            if(hit.rigidbody != null)
            {
                hit.rigidbody.AddForce(-hit.normal * force);
            }
            
        }
        GameObject impactGO = Instantiate(Impact, hit.point, Quaternion.LookRotation(hit.normal));
        Destroy(impactGO, 2f);
        GameObject Socket = Instantiate(ammoSocket, exitSocket.transform.position, Quaternion.identity);
        Socket.GetComponent<Rigidbody>().velocity = exitSocket.transform.forward * 1;
    }
}
