using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.SceneManagement;
using UnityEngine.XR.ARSubsystems;
using UnityEngine.XR.ARKit;
public class SceneReset : MonoBehaviour
{
    Scene scene;
    public ARSession session;

    // Start is called before the first frame update
    void Start()
    {
        scene = SceneManager.GetActiveScene();
        Debug.Log("Active Scene name is: " + scene.name + "\nActive Scene index: " + scene.buildIndex);
    }

    public void ResetButton()
    {
        session.Reset();
        SceneManager.LoadScene("AllScenes");
    }
}
