using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TouchAnimation : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;
    public GameObject currObj;
    public ParticleSystem mediaParticles;

    Animator animator;
    private Vector3 position;
    private float width;
    private float height;

    void Awake()
    {
        width = (float)Screen.width / 2.0f;
        height = (float)Screen.height / 2.0f;

        // Position used for the cube.
        position = new Vector3(0.0f, 0.0f, 0.0f);
        mediaParticles.Stop();
    }
    // Start is called before the first frame update
    void Start()
    {
        animator = currObj.GetComponent<Animator>();

    }
    void OnGUI()
    {
        myLog = GUI.TextArea(new Rect(700, 0, 100, 100), debugLog);
    }
    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0)
        {
            Touch touch = Input.GetTouch(0);
            debugLog = "touch true";

            Vector2 pos = touch.position;
            pos.x = (pos.x - width) / width;
            pos.y = (pos.y - height) / height;
            position = new Vector3(-pos.x, pos.y, 0.0f);

            // Position particle
            mediaParticles.transform.position = position;
            mediaParticles.Play();

            //animator.SetBool("TouchBool", true);
            //StartCoroutine(touchFalse());
            //animator.runtimeAnimatorController = Resources.Load<RuntimeAnimatorController>("afterTouch");
        }
    }

    private IEnumerator touchFalse()
    {
        debugLog = "wait10sec";
        yield return new WaitForSeconds(10);
        debugLog = "touchFalse";
        animator.SetBool("TouchBool", false);
    }
}
