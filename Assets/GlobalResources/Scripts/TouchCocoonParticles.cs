using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARSubsystems;
using UnityEngine.XR.ARKit;
public class TouchCocoonParticles : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;
    //public Material matAfterTouch;
    //public GameObject Cocoon;
    public ParticleSystem trackParticles;

    void Awake()
    {
        trackParticles.Stop();
    }
    // Start is called before the first frame update
    void Start()
    {
    }

    void OnGUI()
    {
        //myLog = GUI.TextArea(new Rect(500, 0, 100, 100), debugLog);
    }


    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0)
        {
            Touch touch = Input.GetTouch(0);
            debugLog = "" + touch.phase;
            trackParticles.Play();
            //Cocoon.GetComponent<Renderer>().material = matAfterTouch;
        }
    }
}
