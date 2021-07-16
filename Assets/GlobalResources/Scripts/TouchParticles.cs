using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARSubsystems;
using UnityEngine.XR.ARKit;
public class TouchParticles : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;
    //public GameObject currObj;
    public ParticleSystem touch1;
    public ParticleSystem touch2;
    public ParticleSystem touch3;
    public ParticleSystem touch4;

    void Awake()
    {
        touch1.Stop();
        touch2.Stop();
        touch3.Stop();
        touch4.Stop();
    }
    // Start is called before the first frame update
    void Start()
    {

    }
    void OnGUI()
    {
        //myLog = GUI.TextArea(new Rect(700, 0, 100, 100), debugLog);
    }
    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0)
        {
            Touch touch = Input.GetTouch(0);
            debugLog = "touch true";
            
            // Position particle
            touch1.Play();
            touch2.Play();
            touch3.Play();
            touch4.Play();
            //StartCoroutine(touchFalse());
        }
    }

    private IEnumerator touchFalse()
    {
        yield return new WaitForSeconds(2);
        debugLog = "touchFalse";
        touch1.Stop();
        touch2.Stop();
        touch3.Stop();
        touch4.Stop();
    }
}
