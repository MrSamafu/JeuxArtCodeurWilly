using UnityEngine;
using Mirror;

public class Player : NetworkBehaviour
{
    [SyncVar]
    private bool _isDead = false;
    public bool isDead
    {
        get { return _isDead; }
        protected set { _isDead = value;  }
    }
    
    public int maxHealth = 100;

    [SyncVar]
    public int currentHealth;

   
    public Behaviour[] disableOnDeath;
    private bool[] wasEnable;

    public void Setup()
    {
        wasEnable = new bool[disableOnDeath.Length];
        for (int i = 0; i < disableOnDeath.Length; i++)
        {
            wasEnable[i] = disableOnDeath[i].enabled;
        }
        SetDefault();
    }

    [ClientRpc]
    public void RpcTakeDamage(int _amount)
    {
        if (isDead)
        {
            return;
        }

        currentHealth -= _amount;
        Debug.Log(transform.name + " à maintenant : " + currentHealth + " points de vie.");

        if(currentHealth <= 0)
        {
            Die();
        }
    }
    public void SetDefault()
    {
        isDead = false;
        currentHealth = maxHealth;

        for (int i = 0; i < disableOnDeath.Length; i++)
        {
            disableOnDeath[i].enabled = wasEnable[i];
        }

        Collider _col = GetComponent<Collider>();
        if(_col != null)
        {
            _col.enabled = true;
        }
       
    }
    private void Die()
    {
        isDead = true;
        //Désactiver les components du joueur
        for (int i = 0; i < disableOnDeath.Length; i++)
        {
            disableOnDeath[i].enabled = false;
        }
        Collider _col = GetComponent<Collider>();
        if (_col != null)
        {
            _col.enabled = false;
        }
        Debug.Log(transform.name + " est mort !");
        //appeler la fonction de respawn

    }

}
